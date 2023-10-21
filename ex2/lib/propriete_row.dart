import 'package:ex2/propriete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProprieteRow extends StatelessWidget {
  const ProprieteRow({Key? key, required this.propriete}) : super(key: key);

  final Propriete propriete;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${propriete.vendre ? 'To Sell' : 'To Rent'} : ${propriete.appartement ? 'flat' : 'house'} of ${propriete.metreCarre} m²"),
   subtitle: Text("${propriete.nbChambre} bedrooms - ${propriete.prix} € ")
    );
  }
}
