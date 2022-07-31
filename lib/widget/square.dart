import 'package:flutter/material.dart';

///[extends]は継承。親クラス[StatelessWidget]を継承してる。
class Square extends StatelessWidget {
  const Square({
    Key? key,

    ///[Board]から値を受け取るための引数
    required this.onTap,
    required this.value,
  }) : super(key: key);

  ///[Board]から値を受け取るためのフィールド
  final void Function() onTap;
  final String? value;

  @override
  Widget build(BuildContext context) {
    //タッチイベントを検出
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(9, 9, 9, 1), width: 1),
        ),
        child: Center(
          child: Text(
            value ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
