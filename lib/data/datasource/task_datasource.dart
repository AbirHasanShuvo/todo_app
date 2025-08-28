import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/utils.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();
  factory TaskDatasource() => _instance;

  TaskDatasource._() {
    _initDB();
  }

  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join('dbPath', DBKeys.dbName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
${DBKeys.dbTable}(
${DBKeys.idColumn}INTEGER PRIMARY KEY AUTOINCREMENT,
${DBKeys.titleColumn}TEXT,
${DBKeys.noteColumn}TEXT,
${DBKeys.dateColumn}TEXT,
${DBKeys.timeColumn}TEXT,
${DBKeys.categoriesColumn}TEXT,
${DBKeys.isCompletedColumn}TEXT,




)
''');
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        DBKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  //for the update process is here

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        DBKeys.dbTable,
        task.toJson(),
        whereArgs: [task.id],
      );
    });
  }

  //delete all the tasks

  Future<int> deleteTasks(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(DBKeys.dbTable, where: 'id = ?');
    });
  }

  //new list of everything

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> data = await db.query(
      DBKeys.dbTable,
      orderBy: "id desc",
    );

    return List.generate(data.length, (index) => Task.fromJson(data[index]));
  }
}
