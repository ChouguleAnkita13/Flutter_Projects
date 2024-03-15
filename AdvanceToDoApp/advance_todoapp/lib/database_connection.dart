import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
// import 'todoapp.dart';
import 'model_class.dart';

dynamic database;

 Future<void> databaseConnection() async {
    database = openDatabase(
        path.join(await getDatabasesPath(), "todoappDB7.db"),
        version: 1, onCreate: (db, version) async {
      await db.execute('''Create table ToDoTask(
          taskId INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          description TEXT,
          date DATE
        )''');
    }); 
    // await ToDoApp.getData();
}

//insert task

  Future<void> insertTask(ToDoListModel obj) async {
    final localDB = await database;

    await localDB.insert('ToDoTask', obj.todoTaskMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//fetch tasks
  Future<List<ToDoListModel>> getAllTask() async {
    final localDB = await database;

    List<Map<String,dynamic>> taskList = await localDB.query('ToDoTask');

    return List.generate(taskList.length, (idx) {
      return ToDoListModel(
          taskId: taskList[idx]['taskId'],
          title: taskList[idx]['title'],
          description: taskList[idx]['description'],
          date: taskList[idx]['date']);
    });
  }

//delete
Future<void> deleteTask(ToDoListModel obj)async{
  final localDB=await database;

  await localDB.delete(
    'ToDoTask',
    where:'taskId=?',
    whereArgs:[obj.taskId]
  );
}
//update
Future<void> updateTask(ToDoListModel obj)async{
  final localDB=await database;

  await localDB.update(
    'ToDoTask',
    obj.todoTaskMap(),
    where:'taskId=?',
    whereArgs:[obj.taskId]
  );
}
