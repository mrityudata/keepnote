import 'package:keepnote/app/index.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
 static final DatabaseHelper _databaseHelper = DatabaseHelper._init();
 static Database? _database;

 DatabaseHelper._init();

 factory DatabaseHelper() {
  return _databaseHelper;
 }

 Future<Database?> get database async {
  if(_database != null) return _database;
  _database = await _initDB('notes.db');
  return _database;
 }

 Future<Database?> _initDB(String dbName) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, dbName);
  return await openDatabase(path, version: 1, onCreate: _createDB);
 }

 Future<void> _createDB(Database db, int version) async {
  //create table
  await db.execute('''
  CREATE TABLE notes(
  id TEXT PRIMARY KEY,
  tag TEXT NOT NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  timestamp INTEGER NOT NULL
  )
  ''');
 }

 Future<int> insertNote(Map<String,dynamic> note) async {
  final db = await database;
  int result = await db!.insert('notes', note);
  return result;
 }

 Future<List<NotesModel>> getNoteList(String tag) async {
  final db = await database;
  final result = await db!.query('notes', where: 'tag = ?',whereArgs: [tag]);
  return result.map( (element) => NotesModel.fromJson(element)).toList();
 }

 Future<int> updateNote(String id, String newTitle, String newDescription) async {
   final db = await database;
   final result = await db!.update(
       'notes',
       {
        'title' : newTitle,
        'description' : newDescription
       },
    where: 'id = ?',
    whereArgs: [id]
   );
   return result;
 }

}