import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model_class.dart';

dynamic database;
List cardList=[];

Future<void> dbConnection() async {
    database = openDatabase(
      join(await getDatabasesPath(), "todoappDB9.db"),
        version: 1, onCreate: (db, version) async {
      await db.execute('''Create table ToDoTask(
          taskId INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          description TEXT,
          date DATE
        )''');
    }); 
    cardList=await getAllTask();
    print(cardList);
}
//insert task
  Future<void> insertTask(ToDoListModel obj) async {
    final localDB = await database;

    await localDB.insert('ToDoTask', obj.todoTaskMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Inserted");
    cardList=await getAllTask();
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
