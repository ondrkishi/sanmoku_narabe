import 'package:flutter/material.dart';
import 'package:sanmoku_narabe/judge/judge.dart';
import 'package:sanmoku_narabe/widget/square.dart';

class Board extends StatefulWidget {
  const Board({
    Key? key,
  }) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  //要素数9（マス目の数）のリストを作成、初期値はnullとする
  List<String?> _squares = List.generate(9, (index) => null);
  late List<String?> squares;
  //現在のプレイヤーを判定する変数 [true]='X' [false]='O'
  bool _xlsNext = true;

  //マス目をタップした時の処理
  void handleClick(int i) {
    squares = _squares.sublist(0);
    //引き分けを含む勝敗がついている場合、もしくはすでに埋まっているマスの場合は何も実行せずreturn
    if (calculateWinner(squares) != null || squares[i] != null) {
      return;
    }
    //[_xlsNext]が[true]であれば'X'を表示、それ以外なら'O'を表示
    squares[i] = _xlsNext ? 'X' : 'O';
    setState(() {
      _squares = squares;
      //プレイヤーを交換する
      _xlsNext = !_xlsNext;
    });
  }

  //「もう一度遊ぶ」ボタン押下時の処理
  void clear() {
    //マス目の中身のListをすべてnullに戻す
    _squares = List.generate(9, (index) => null);
    //プレイヤーを'X'に戻す
    _xlsNext = true;
    //画面を再描画
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //勝敗の判定結果
    String? winner = calculateWinner(_squares);
    //盤面上に表示するテキスト
    String status;
    //勝敗ごとに表示するテキストを設定
    if (winner != null) {
      if (winner == 'draw') {
        status = 'Draw';
      } else {
        status = 'Winner: $winner';
      }
    } else {
      status = 'Next Playr: ${_xlsNext ? 'X' : 'O'}';
    }

    return Column(
      children: [
        Text(status,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 34 * 9,
          width: 34 * 9,
          //グリットを作成
          child: GridView.count(
            //GridViewの大きさを自動で調節する。デフォルトはfalse
            shrinkWrap: true,
            //横に並べる数
            crossAxisCount: 3,

            ///[List.generate]で規則性のあるListを表示
            //戻り値の型はListなので中身はWidgetに限らずStringでもよい
            //ただ並べ方はColumnやRowなどで指定する
            //リスト内でのスクロールはできない→したい場合は[SingleChildScrollView]などで設定する。
            children: List.generate(
              //Listの数
              9,

              ///[Square]に配列[_squares]の[i]番目の値を渡す
              (int i) => Square(
                onTap: () => handleClick(i),
                value: _squares[i],
              ),
            ),
          ),
        ),
        if (winner != null)
          ElevatedButton(
            onPressed: () => clear(),
            child: const Text('もう一度遊ぶ'),
          ),
      ],
    );
  }
}
