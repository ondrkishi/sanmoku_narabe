import 'package:flutter/material.dart';
import 'package:sanmoku_narabe/widget/boad.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        ///端末に「debug」のリボンを表示するかどうか。falseで非表示。デフォルトはtrue。
        debugShowCheckedModeBanner: true,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('三目並べ'),
            ),
            body: Center(
              child: Column(children: [
                const Board(),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(children: const []),
                ),
              ]),
            )));
  }
}
