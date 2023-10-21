import 'package:ex1/nobel_prize.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Nobel Prize',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nobel Prize'),
        ),
        body:
            NobelPrize(motivation: laureate1["motivation"]!),
      )
    );
  }

}
const laureate1 = {
  "id": "819",
  "firstname": "Al",
  "surname": "Gore",
  "motivation":
  "\"for their efforts to build up and disseminate greater knowledge about man-made climate change, and to lay the foundations for the measures that are needed to counteract such change\"",
  "share": "2"
};
