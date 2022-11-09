// ignore_for_file: file_names

import 'package:was_gibts_heute/models/list_item.dart';
import 'package:flutter/material.dart';
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

    final editedListItem =
        ModalRoute.of(context)!.settings.arguments as ListItem;

    bool inEditMode = editedListItem.name != "";

    if (inEditMode) {
      _textEditingController.text = editedListItem.name;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(inEditMode ? "Gericht bearbeiten" : "Gericht hinzufügen"),
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
                    if (inEditMode) {
                      ListItem newListItem = editedListItem.copyWith(
                          name: _textEditingController.text);
                      int indexOfEditedItem =
                          gerichteliste.indexOf(editedListItem);
                      gerichteliste[indexOfEditedItem] = newListItem;
                    } else {
                      gerichteliste.add(ListItem(
                        name: _textEditingController.text,
                      ));
                    }

                    Navigator.pop(context);
                  },
                  child: Text(inEditMode ? "Speichern" : "Hinzufügen")),
            ],
          ),
        ));
  }
}
