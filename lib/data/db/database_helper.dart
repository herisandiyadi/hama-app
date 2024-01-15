import 'dart:typed_data';

import 'package:hama_app/data/models/signature/signature_response.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._createObject();
  String tableSignature = 'tb_signature';
  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createObject();
    return _databaseHelper!;
  }

  Future<Database> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'hamaapp.db');

    // await deleteDatabase(path);
    // await clearCart();

    var todoDatabase =
        openDatabase(path, version: 1, onCreate: _createDatabase);

    return todoDatabase;
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableSignature (
        id INTEGER PRIMARY KEY ,
        image UINT8LIST
      )
    ''');
  }

  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await database;
    var mapList = await db.query(tableSignature, orderBy: 'id');
    return mapList;
  }

  Future<List<SignatureResponse>> selectById(int id) async {
    Database db = await database;
    var mapList = await db.query(tableSignature, where: 'id = $id');
    return mapList.map((data) => SignatureResponse.fromMap(data)).toList();
  }

  Future<int> insert(Uint8List dataImage) async {
    Database db = await database;
    int count = await db.insert(tableSignature, {'image': dataImage});
    return count;
  }

  Future<int> deleteById(int id) async {
    Database db = await database;
    int count = await db.delete(tableSignature, where: 'id=?', whereArgs: [id]);

    return count;
  }

  Future<List<SignatureResponse>> getSignature() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      tableSignature,
    );
    return result.map((data) => SignatureResponse.fromMap(data)).toList();
  }

  Future<int> clearAll() async {
    Database db = await database;
    int count = await db.delete(tableSignature);

    return count;
  }
}
