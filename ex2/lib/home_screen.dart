import 'package:ex2/propriete.dart';
import 'package:ex2/propriete_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSell = true;

  @override
  Widget build(BuildContext context) {
    var proprietes = defaultPropriete
        .where((element) =>
            showSell ? element.vendre == false : element.vendre == true)
        .map((e) => ProprieteRow(propriete: e))
        .toList();
    proprietes.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: Text("Propriete to rent/sell"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sell"),
                Switch(
                  // This bool value toggles the switch.
                  value: showSell,
                  activeColor: Colors.black,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      showSell = value;
                    });
                  },
                ),
                Text("rent"),
              ],
            ),
            Padding(padding: EdgeInsets.all(15.0)),
            Expanded(
              child: Container(
                child: Center(
                  child: SizedBox(
                    width: 512.0,
                    child: ListView.builder(
                      itemCount: proprietes.length,
                      itemBuilder: (context, i) {
                        return Container(
                          child: proprietes[i],
                          margin: const EdgeInsets.only(bottom: 25.0),
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(color: Colors.blueAccent),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
