import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model_class.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

dynamic database;

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() {
    return _ToDoApp();
  }
}

class _ToDoApp extends State<ToDoApp> {
  @override
  void initState() {
    super.initState();
    dbConnection();
  }

  List<ToDoListModel> cardList = [];

  Future<void> dbConnection() async {
    database = openDatabase(
        path.join(await getDatabasesPath(), "todoappDB9.db"),
        version: 1, onCreate: (db, version) async {
      await db.execute('''Create table ToDoTask(
          taskId INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          description TEXT,
          date DATE
        )''');
    });
    getData();
  }

//insert task
  Future<void> insertTask(ToDoListModel obj) async {
    final localDB = await database;

    await localDB.insert('ToDoTask', obj.todoTaskMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Inserted");
    getData();
  }

  Future getData() async {
    List<ToDoListModel> task = await getAllTask();
    setState(() {
      cardList = task;
    });
  }

//fetch tasks
  Future<List<ToDoListModel>> getAllTask() async {
    final localDB = await database;

    List<Map<String, dynamic>> taskList = await localDB.query('ToDoTask');

    return List.generate(taskList.length, (idx) {
      return ToDoListModel(
          taskId: taskList[idx]['taskId'],
          title: taskList[idx]['title'],
          description: taskList[idx]['description'],
          date: taskList[idx]['date']);
    });
  }

//delete
  Future<void> deleteTask(ToDoListModel obj) async {
    final localDB = await database;

    await localDB
        .delete('ToDoTask', where: 'taskId=?', whereArgs: [obj.taskId]);
  }

//update
  Future<void> updateTask(ToDoListModel obj) async {
    final localDB = await database;

    await localDB.update('ToDoTask', obj.todoTaskMap(),
        where: 'taskId=?', whereArgs: [obj.taskId]);
  }

  //TextEditingControllers
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //Global Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// submitTask Function
  void submitTask(bool isEdit, [ToDoListModel? toDoListModelObj]) {
    if (titleController.text.trim().isNotEmpty &&
        descriptController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!isEdit) {
        insertTask(ToDoListModel(
            title: titleController.text,
            description: descriptController.text,
            date: dateController.text));
      } else {
        setState(() {
          toDoListModelObj!.title = titleController.text.trim();
          toDoListModelObj.description = descriptController.text.trim();
          toDoListModelObj.date = dateController.text.trim();
          updateTask(toDoListModelObj);
        });
      }
    }
    clearController();
  }

//To edit Task
  void editTask(ToDoListModel toDoListModelObj) {
    titleController.text = toDoListModelObj.title;
    descriptController.text = toDoListModelObj.description;
    dateController.text = toDoListModelObj.date;
    showBottomSheet(true, toDoListModelObj);
  }

//To Clear all TextEditingcontrollers

  void clearController() {
    titleController.clear();
    descriptController.clear();
    dateController.clear();
  }

// Function For display BottomSheet

  void showBottomSheet(bool isEdit, [ToDoListModel? toDoListModelObj]) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                  //To avoid the keyboard overlap the screen
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Create Task",
                    style: GoogleFonts.quicksand(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title",
                            style: GoogleFonts.quicksand(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(89, 57, 241, 1))),
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(89, 57, 241, 1),
                                    width: 0.5)),
                          ),
                          cursorColor: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Description",
                          style: GoogleFonts.quicksand(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(89, 57, 241, 1),
                          ),
                        ),
                        TextFormField(
                          controller: descriptController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(89, 57, 241, 1),
                                    width: 0.5)),
                          ),
                          cursorColor: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Date",
                          style: GoogleFonts.quicksand(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(89, 57, 241, 1)),
                        ),
                        TextFormField(
                          controller: dateController,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.date_range_rounded),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(89, 57, 241, 1),
                                    width: 0.5)),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024),
                                lastDate: DateTime(2025));
                            String formatDate =
                                DateFormat.yMMMd().format(pickedDate!);
                            dateController.text = formatDate;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      isEdit
                          ? submitTask(isEdit, toDoListModelObj)
                          : submitTask(isEdit);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size(300, 50),
                      backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
                    ),
                    child: Text(
                      "submit",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 30, top: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning",
                  style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                Text(
                  "Ankita",
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "CREATE TO DO LIST",
                    style: GoogleFonts.quicksand(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 40),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: ListView.builder(
                          itemCount: cardList.length,
                          itemBuilder: ((context, index) {
                            return Slidable(
                              closeOnScroll: true,
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const DrawerMotion(),
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            editTask(cardList[index]);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  89, 57, 241, 1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Icon(Icons.edit,
                                                color: Colors.white, size: 20),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              deleteTask(cardList[index]);
                                              cardList.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  89, 57, 241, 1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Icon(Icons.delete,
                                                color: Colors.white, size: 20),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 0.05),
                                        width: 0.5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.13),
                                          offset: Offset(0, 4),
                                          blurRadius: 20)
                                    ]),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 52,
                                      width: 52,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              217, 217, 217, 1),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Image.asset(
                                        "assets/Group.png",
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        width: 23,
                                        height: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cardList[index].title,
                                            style: GoogleFonts.quicksand(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            cardList[index].description,
                                            style: GoogleFonts.quicksand(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.7),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            cardList[index].date,
                                            style: GoogleFonts.quicksand(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        activeColor: Colors.green,
                                        value: true,
                                        onChanged: (val) {})
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBottomSheet(false);
          },
          backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
          child: const Icon(
            Icons.add,
            size: 46,
          )),
    );
  }
}
