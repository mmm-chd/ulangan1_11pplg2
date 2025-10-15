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

// Just For Check database
  Future<void> printAllData() async {
    final data = await db;
    final List<Map<String, dynamic>> results = await data.query('toDoItem');
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

  // Update data
  Future<int> updateTask(ToDoItem item) async {
  final client = await db;
  return await client.update(
    'toDoItem',
    {
      'title': item.title,
      'desc': item.desc,
      'date': item.date.toString(),
      'startTime': item.startTime,
      'endTime': item.endTime,
      'priority': item.priority.value,
      'priorityStr': item.priorityStr,
      'isCompleted': item.isCompleted ? 1 : 0,
    },
    where: 'id = ?',
    whereArgs: [item.id],
  );
}


  // Get data
  Future<List<ToDoItem>> getList() async {
    final client = await db;
    final List<Map<String, dynamic>> data = await client.query(
      'toDoItem',
      orderBy: 'id DESC',
    );
    return data.map((map) => ToDoItem.fromMap(map)).toList();
  }

  //Delete task berdasarkan ID
  Future<int> deleteById(int id) async {
    final client = await db;
    return await client.delete('toDoItem', where: 'id = ?', whereArgs: [id]);
  }

  //Delete semua task
  Future<void> deleteAllCompleted() async {
    final client = await db;
    await client.delete('toDoItem', where: 'isCompleted = ?', whereArgs: [1]);
  }

// uppdate isCompleted When complete menu tapped
  Future<void> updateIsCompleted(int id, int isCompleted) async {
    final client = await db;
    await client.update(
      'toDoItem',
      {'isCompleted': isCompleted},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
