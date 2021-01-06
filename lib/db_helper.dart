import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'list_model.dart';

class DBHelper {
  static Database _database;
  static const String ID = 'id';
  static const String TITLE = 'title';
  static const String CONTENT = 'content';
  static const String DATE = 'date';
  static const String TABLE = 'notes';
  static const String DB_NAME = 'note_app.db';

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    io.Directory documentDirectoy = await getApplicationDocumentsDirectory();
    String path = join(documentDirectoy.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $TITLE TEXT, $CONTENT TEXT, $DATE DATE)");
  }

  Future<Note> insert(Note note) async {
    note.id = await _database.insert(TABLE, note.toMap());
    return note;
  }

  Future<Note> getNote(int id) async {
    List<Map> maps = await _database.query(TABLE,
        columns: [ID, TITLE, CONTENT, DATE], where: '$id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return Note.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await _database.delete(TABLE, where: '$id = ?', whereArgs: [id]);
  }

  Future<int> update(Note note) async {
    return await _database
        .update(TABLE, note.toMap(), where: '$ID = ?', whereArgs: [note.id]);
  }

  Future close() async => _database.close();
}
