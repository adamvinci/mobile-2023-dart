import 'package:ex3/my_notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  final void Function(Notes) createNote;
  const MyForm(this.createNote,{Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          TextFormField(
            controller: controller1,
            decoration: const InputDecoration(labelText: "Note Title"),
            validator: (value) =>
            (value == null || value.isEmpty)
                ? "Your title can't be empty"
                : null,
          ),
          Padding(padding: EdgeInsets.all(15.0)),
          TextFormField(
            controller: controller2,
            decoration: const InputDecoration(labelText: "Note Text"),
            validator: (value) =>
            (value == null || value.isEmpty)
                ? "Your note can't be empty"
                : null,
          ),
          ElevatedButton(
            child: const Text("Create Notes"),
            onPressed: () {
              if (key.currentState!.validate()) {
                widget.createNote(Notes(text: controller2.text, titre: controller1.text));
                controller1.text = "";
                controller2.text = "";
              }
            },
          )
        ],
      ),
    );

  }
}
