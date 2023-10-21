import 'package:flutter/material.dart';
import 'package:ftuto1/my_cart.dart';
import 'package:ftuto1/my_oeschinen_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(

          children : [
            const MyOeschinenCard(),
            const MyCard(title1: "titre1"),
            const MyCard(
              imageUril: "images/lake.jpg",
              title1: "Oeschinen Lake Camping",
              title2: "CH",
              description: "Wow... Nowhere is better than this...",
            ),

          ],
        ),
      ),
    );
  }

}