import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<void> initDatabase() async {
    await db;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'toDoItem.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE toDoItem(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          title TEXT NOT NULL, 
          desc TEXT, 
          date TEXT NOT NULL, 
          startTime TEXT NOT NULL, 
          endTime TEXT NOT NULL, 
          priority INTEGER NOT NULL, 
          priorityStr TEXT NOT NULL, 
          isCompleted INTEGER DEFAULT 0)''');
      },
    );
  }

  Future<void> printAllData() async {
    // Your database instance
    final data = await db;
    // Query all rows from a table
    final List<Map<String, dynamic>> results = await data.query('toDoItem');

    // Print the data
    print('Total records: ${results.length}');
    for (var row in results) {
      print(row);
    }
  }

  // Add data
  Future<int> insertList(
    String title,
    String desc,
    String date,
    String startTime,
    String endTime,
    int priorityCo,
    String priorityStr,
    int isCompleted,
  ) async {
    final client = await db;
    return client.insert('toDoItem', {
      'title': title,
      'desc': desc,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'priority': priorityCo,
      'priorityStr': priorityStr,
      'isCompleted': isCompleted,
    });
  }

  // Get data
  Future<List<ToDoItem>> getList() async {
    final client = await db;
    final List<Map<String, dynamic>> data = await client.query(
      'toDoItem',
      orderBy: 'id DESC',
    );

    // Convert di database layer
    return data.map((map) => ToDoItem.fromMap(map)).toList();
  }
}
