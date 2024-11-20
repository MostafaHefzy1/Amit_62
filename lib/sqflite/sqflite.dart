
import 'package:flutter_application_1/sqflite/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  DataBaseHelper._();

  static final DataBaseHelper dataBaseHelper = DataBaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await createDataBase();
    return _database;
  }

  createDataBase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note.db');

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute(
            ''' CREATE TABLE tableOne(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,date TEXT ,  time TEXT)''');
      },
    );

    return database;
  }

  insertDataBase({required TaskModel taskModel}) async {
    var clientDB = await database;
    return await clientDB?.insert("tableOne", taskModel.toMap());
  }

  Future<List<TaskModel>?> getAllProductInCart() async {
    var clientDB = await database;
    List<Map<String, dynamic>>? maps = await clientDB?.query("tableOne");

    return maps!.isNotEmpty
        ? maps.map((task) => TaskModel.forJson(task)).toList()
        : [];
  }

  updateTask(TaskModel taskModel) async {
    var clientDB = await database;
    return clientDB?.update("tableOne", taskModel.toMap(),
        where: 'id = ?', whereArgs: [taskModel.id]);
  }

  deleteTask(TaskModel taskModel) async {
    var clientDB = await database;
    return await clientDB
        ?.delete("tableOne", where: 'id = ?', whereArgs: [taskModel.id]);
  }

  deleteAllTasks() async {
    var clientDB = await database;
    return await clientDB?.delete("tableOne");
  }
}
