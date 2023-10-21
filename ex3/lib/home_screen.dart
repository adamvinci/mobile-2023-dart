import 'package:ex3/my_form.dart';
import 'package:ex3/my_notes.dart';
import 'package:ex3/notes_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultNotes=notes;
    return Scaffold(
      appBar: AppBar(
        title: Text("Propriete to rent/sell"),
      ),
      body:  Column(
        children: [
          Padding(padding: EdgeInsets.all(15.0)),
          Expanded(child:
          Container(

            child: Center(
                child: SizedBox(
                  width: 512.0,
                  child: ListView.builder(
                    itemCount: defaultNotes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child :  ListTile(
                          title: Text(defaultNotes[index].titre),
                          subtitle: Text(defaultNotes[index].text),
                          trailing: IconButton(
                            onPressed: () {
                              defaultNotes.remove(defaultNotes[index]);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 5.0),

                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(color: Colors.blueAccent),
                        ),
                      );
                    },
                  ),
                )

            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 300 ),
            child:   MyForm((value) => setState(() => defaultNotes.add(value) )),
          ),
        ],
      )


    );

  }
}
