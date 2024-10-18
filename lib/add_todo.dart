import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController tc = TextEditingController();
  final TextEditingController dc = TextEditingController();
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("Demo");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Form(
        key: _key,
        child: Column(children: [
          TextFormField(
            controller: tc,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Title",
            ),
          ),
          TextFormField(
            controller: dc,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Description",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _collectionReference
                  .add({"Title": tc.text, "Description": dc.text}).then(
                      (_) => Navigator.of(context).pop());
            },
            child: const Text("Add"),
          )
        ]),
      ),
    );
  }
}
