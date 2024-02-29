import 'package:flutter/material.dart';
import 'package:todolistapp/model_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptController = TextEditingController();
  TextEditingController dateController = TextEditingController();

//=======cardList to add task
  List cardList = [
    ToDoListModel(
        title: "Implement Login Page",
        description: "Create a sleek and secure login page with email and password authentication.",
        date: "Feb 28, 2024"),
    ToDoListModel(
        title: "Code Review",
        description: "Review pull requests from team members and provide feedback.",
        date: "Feb 28, 2024"),
  ];
  
//CardColorList=======
  List cardColorList = const [
    Color.fromRGBO(250, 232, 232, 1),
    Color.fromRGBO(232, 237, 250, 1),
    Color.fromRGBO(250, 249, 232, 1),
    Color.fromRGBO(250, 232, 250, 1),
  ];

// submitTask Function
  void submitTask(bool isEdit,[ToDoListModel? toDoListModelObj]){
    if(titleController.text.trim().isNotEmpty &&
    descriptController.text.trim().isNotEmpty &&
    dateController.text.trim().isNotEmpty){
    if(!isEdit){
      setState(() {
        cardList.add(ToDoListModel(title: titleController.text,
                          description: descriptController.text,
                          date: dateController.text));
      });
    }
    else{
      setState(() {
        toDoListModelObj!.title= titleController.text.trim();
        toDoListModelObj.description=descriptController.text.trim();
        toDoListModelObj.date = dateController.text.trim();
      });
    }
    }
    clearController();
  }

//To edit Task 
  void editTask(ToDoListModel toDoListModelObj){
    titleController.text = toDoListModelObj.title;
    descriptController.text = toDoListModelObj.description;
    dateController.text = toDoListModelObj.date;

    showBottomSheet(true,toDoListModelObj);                      
  }

//To Delete Task
  void deleteTask(ToDoListModel toDoListModelObj){
    setState(() {
      cardList.remove(toDoListModelObj);
    });
  }

//To Clear all TextEditingcontrollers
  void clearController(){
    titleController.clear();
    descriptController.clear();
    dateController.clear();
  }

// Function For display BottomSheet
  void showBottomSheet(bool isEdit,[ToDoListModel? toDoListModelObj]) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 3,
                ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title",
                        style: GoogleFonts.quicksand(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(0, 139, 148, 1))),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                         border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 139, 148, 1),
                                width: 0.5)),
                      ),
                      cursorColor: const Color.fromRGBO(0, 139, 148, 1),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Description",
                        style: GoogleFonts.quicksand(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(0, 139, 148, 1),),),
                    TextField(
                      controller: descriptController,
                      decoration: const InputDecoration(
                         border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 139, 148, 1),
                                width: 0.5)),
                      ),
                      cursorColor: const Color.fromRGBO(0, 139, 148, 1),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Date",
                      style: GoogleFonts.quicksand(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(0, 139, 148, 1)),
                    ),
                    TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 139, 148, 1),
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
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      isEdit? submitTask(isEdit,toDoListModelObj)
                        :submitTask(isEdit);           
                      Navigator.pop(context);                     
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),),
                      fixedSize: const Size(300, 50),
                      backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
                    ),
                    child: Text(
                      "submit",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }

//=========build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-do list",
          style:
              GoogleFonts.quicksand(fontWeight: FontWeight.w700, fontSize: 26),
        ),
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListView.builder(
            itemCount: cardList.length,
            itemBuilder: ((context, index) {
              return Container(
                width: 330,
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: cardColorList[index % cardColorList.length],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          margin: const EdgeInsets.only(
                              top: 15, left: 5, right: 15),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 255, 255, 1),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.07),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 1)
                              ]),
                          child: Image.asset(
                            "assets/img.png",
                            color: const Color.fromRGBO(199, 199, 199, 1),
                            height: 13,
                            width: 13,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cardList[index].title,
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                cardList[index].description,
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: const Color.fromRGBO(84, 84, 84, 1),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 3),
                        Text(
                          cardList[index].date,
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: const Color.fromRGBO(132, 132, 132, 1)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            editTask(cardList[index]);                         
                          },
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 24,
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            deleteTask(cardList[index]);
                          },
                          child: const Icon(
                            Icons.delete_outlined,
                            size: 24,
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(false);
        },
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
