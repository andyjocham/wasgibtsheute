import 'package:flutter/material.dart';
import 'package:was_gibts_heute/models/list_item.dart';

import '../config.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final gerichteliste = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .gerichtelisteList;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gericht hinzufügen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((10)),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    gerichteliste.add(ListItem(
                      name: _textEditingController.text,
                    ));
                    Navigator.pop(context);
                  },
                  child: const Text("Hinzufügen")),
            ],
          ),
        ));
  }
}
