//
//勝敗の判定
//

//マス目の中身のListを引数にして、揃っているところがあれば揃った方の'X' or 'O'を返す
String? calculateWinner(List<String?> squares) {
  //揃うパターンのindexのList
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  for (var i = 0; i < lines.length; i++) {
    final indexs = lines[i];

    //揃ったマス目がないかの判定
    //①マス目の状態がnullではないか
    //②[lines]内の[index]3つの状態が揃っているか
    //③揃っている場合'X' or 'O'どちらでそろっているか（←これをreturnしている）
    if (squares[indexs[0]] != null && squares[indexs[0]] == squares[indexs[1]] && squares[indexs[0]] == squares[indexs[2]]) {
      return squares[indexs[0]];
    }
  }
  //引き分け
  //List内にnullが含まれていない（すべてのマスが埋まっている）かつ勝敗がつかなかった場合
  if (!squares.contains(null)) {
    return 'draw';
  }
  //まだマスがすべて埋まっておらず勝敗がついていなければnullを返す
  return null;
}
