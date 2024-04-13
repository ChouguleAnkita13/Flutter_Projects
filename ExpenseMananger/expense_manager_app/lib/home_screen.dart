import 'package:expense_manager_app/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List colorList = const [
    Color.fromRGBO(0, 174, 91, 0.7),
    Color.fromRGBO(214, 3, 3, 0.7),
    Color.fromRGBO(241, 38, 197, 0.7),
    Color.fromRGBO(0, 148, 255, 0.7),
    Color.fromRGBO(100, 62, 255, 0.7)
  ];
  void showExpenseBottomSheet() {
    showModalBottomSheet(
        context: (context),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            side: BorderSide(color: Color.fromRGBO(191, 189, 189, 1))),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                //To avoid the keyboard overlap the screen
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    height: 36,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "11-06-2022",
                         hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(191, 189, 189, 1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Amount",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    height: 36,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "900",
                         hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(191, 189, 189, 1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Category",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    height: 36,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Shopping",
                         hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(191, 189, 189, 1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Description",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    height: 36,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Lorem Ipsum is simply dummy text of the",
                         hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(191, 189, 189, 1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(67),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            offset: Offset(1, 2),
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                        Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(123, 40),
                            backgroundColor:
                                const Color.fromRGBO(14, 161, 125, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(67))),
                        child: Text(
                          "Add",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
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
      appBar: AppBar(
        title: Text(
          "June 2022",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Color.fromRGBO(33, 33, 33, 1),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 24,
                color: Color.fromRGBO(33, 33, 33, 1),
              ))
        ],
      ),
      drawer: const MyMenuDrawer(),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: ((context, index) {
            return Container(
              padding: const EdgeInsets.only(
                  left: 12, right: 15, top: 10, bottom: 5),
              width: 361,
              height: 80,
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(206, 206, 206, 1), width: 0.5)),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: colorList[index % colorList.length],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Medicine",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.8),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.remove_circle,
                            size: 18,
                            color: Color.fromRGBO(246, 113, 49, 1),
                          )),
                      const SizedBox(width: 5,),
                      Text(
                        "500",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          "3 June | 11:50 AM",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 46,
        width: 166,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(67),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
              )
            ]),
        child: FloatingActionButton(
          onPressed: showExpenseBottomSheet,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(67),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.add_circle_outlined,
                color: Color.fromRGBO(14, 161, 125, 1),
                size: 32,
              ),
              Text(
                "Add Transaction",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(37, 37, 37, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
