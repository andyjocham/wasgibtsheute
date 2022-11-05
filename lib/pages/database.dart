import 'package:flutter/material.dart';
import '../models/list_item.dart';

class Gerichteliste extends StatefulWidget {
  const Gerichteliste({Key? key}) : super(key: key);
  @override
  _GerichtelisteState createState() => _GerichtelisteState();
}

class _GerichtelisteState extends State<Gerichteliste> {
  List<ListItem> gerichtelisteList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerichte"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const ListTile();
          }),
    );
  }
}
