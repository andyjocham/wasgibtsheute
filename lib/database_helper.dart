import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:was_gibts_heute/models/list_item.dart';
import 'package:was_gibts_heute/pages/gerichte_liste.dart';

class DatabaseHelper {
  //Singleton Helper
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "gerichte.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE gerichte(
      id INTEGER PRIMARY KEY,
      name TEXT
    )
  ''');
  }

  Future<List<ListItem>> getListItems() async {
    Database db = await instance.database;
    var gerichteItems = await db.query("gerichte_items", orderBy: "name");
    List<ListItem> gerichteItemsList = gerichteItems.isNotEmpty
        ? gerichteItems.map((e) => ListItem.fromMap(e)).toList()
        : [];
    return gerichteItemsList;
  }

  Future<int> add(ListItem item) async {
    Database db = await instance.database;
    return await db.insert("gerichte_items", item.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete("gerichte_items", where: "id = ?", whereArgs: [id]);
  }

  Future<int> update(ListItem item) async {
    Database db = await instance.database;
    return await db.update("gerichte_items", item.toMap(),
        where: "id = ?", whereArgs: [item.id]);
  }
}
