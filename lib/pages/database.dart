import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:was_gibts_heute/config.dart';
import 'package:was_gibts_heute/models/list_item.dart';

class Gerichteliste extends StatefulWidget {
  const Gerichteliste({Key? key}) : super(key: key);
  @override
  _GerichtelisteState createState() => _GerichtelisteState();
}

class _GerichtelisteState extends State<Gerichteliste> {
  void _showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(text),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final gerichteliste = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .gerichtelisteList;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Gerichte"),
      ),
      body: ListView.builder(
          itemCount: gerichteliste.length,
          itemBuilder: (context, index) {
            final item = gerichteliste[index];

            return Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    flex: 2,
                    onPressed: (context) {
                      Navigator.pushNamed(context, '/add', arguments: item)
                          .then((value) => setState(() {}));
                    },
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Bearbeiten',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        gerichteliste.removeAt(index);
                      });
                      _showSnackbar(context, '${item.name} gelöscht.');
                    },
                    backgroundColor: const Color(0xFFF70929),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Löschen',
                  ),
                ],
              ),
              child: ListTile(
                title: Text(item.name),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add', arguments: ListItem(name: ""))
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
