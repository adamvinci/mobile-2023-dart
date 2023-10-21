import 'package:flutter/cupertino.dart';

class Notes  {
  final String text;
  final String titre;

  Notes({required this.text, required this.titre});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notes &&
          runtimeType == other.runtimeType &&
          titre == other.titre;

  @override
  int get hashCode => titre.hashCode;
}
List<Notes> notes = _createNotes();

List<Notes> _createNotes() {
  Notes note1 = Notes(text: "ABC", titre: "DEF");
  Notes note2 = Notes(text: "Test", titre: "Bonjour tout le monde");
  return [note2, note1];
}
