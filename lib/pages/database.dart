import 'package:flutter/material.dart';
import '../models/list_item.dart';

class Database extends StatefulWidget {
  const Database({Key? key}) : super(key: key);
  @override
  _DatabaseState createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  List<ListItem> databaseList = [];

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
