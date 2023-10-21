import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NobelPrize extends StatelessWidget {

  final String ? surname;
  final String ? firstname;
  final String  motivation;

  const NobelPrize({Key? key, this.surname = "DefaultSurname" , this.firstname = "DefaultFirstName", required this.motivation}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return ListView(
        children :[
          Padding( padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
          ListTile(
              title : Text(surname! + " " +firstname!
                  ,textAlign :TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold), )
          ),
        Padding( padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
    Container(
    margin: const EdgeInsets.all(15.0),
    padding: const EdgeInsets.all(3.0),
    decoration: BoxDecoration(
    color: Colors.grey,
        border: Border.all(color: Colors.grey,)

    ),child:
          ListTile(
              title : Text(motivation
                  ,textAlign :TextAlign.center,style: TextStyle(color: Colors.white), )
          ),
    )
        ]
    );
  }
}
