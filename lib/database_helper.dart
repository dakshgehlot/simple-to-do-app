import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models/Task.dart';

class DatabaseHelper{

  Future<Database> database() async{
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version){
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT )",
        );
      },
      version: 1
    );
  }

  Future<void> insertTask(Task task) async{
    Database _db = await database();
    await _db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> getTask() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query("tasks");
    return List.generate(taskMap.length, (index){
      return Task(id: taskMap[index]['id'], title: taskMap[index]['title'], description: taskMap[index]['description']);
    }

    );
  }

}