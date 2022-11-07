import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/list_item.dart';

class Gerichteliste extends StatefulWidget {
  const Gerichteliste({Key? key}) : super(key: key);
  @override
  _GerichtelisteState createState() => _GerichtelisteState();
}

class _GerichtelisteState extends State<Gerichteliste> {
  List<ListItem> gerichtelisteList = [ListItem(name: "Spaghetti")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerichte"),
      ),
      body: ListView.builder(
          itemCount: gerichtelisteList.length,
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  const SlidableAction(
                    flex: 2,
                    onPressed: null,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Bearbeiten',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        gerichtelisteList.removeAt(index);
                      });
                    },
                    backgroundColor: const Color(0xFFF70929),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Löschen',
                  ),
                ],
              ),
              child: ListTile(
                title: Text(gerichtelisteList[index].name),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
