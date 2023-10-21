import 'package:flutter/material.dart';

import 'my_notes.dart';

class NotesRow extends StatelessWidget {
  final Notes notes;

  NotesRow({required this.notes});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width: 500.0,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text("${notes.titre}"),
                subtitle: Text("${notes.text}"),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );


  }
}

