import 'package:expense_manager_app/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List colorList = const [
    Color.fromRGBO(214, 3, 3, 0.7),
    Color.fromRGBO(241, 38, 197, 0.7),
    Color.fromRGBO(0, 174, 91, 0.7),
    Color.fromRGBO(0, 148, 255, 0.7),
    Color.fromRGBO(100, 62, 255, 0.7)
  ];
  void showCategoryBottomSheet() {
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
                  Center(
                    child: SizedBox(
                      height: 97,
                      width: 74,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 74,
                            height: 74,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromRGBO(140, 128, 128, 0.2),
                            ),
                            child: const Icon(Icons.image_outlined,size: 25,color: Color.fromRGBO(125, 125, 125, 1),),
                          ),
                          Text(
                            "Add",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Image URL",
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
                        hintText: "Enter URL",
                        hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(191, 189, 189, 1),
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
                        hintText: "Enter category name",
                        hintStyle: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Color.fromRGBO(191, 189, 189, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                        )
                          
                        ,
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
          "Categories",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Color.fromRGBO(33, 33, 33, 1),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      drawer: const MyMenuDrawer(),
      body: GridView.builder(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemCount: 4,
          itemBuilder: ((context, index) {
            return Container(
              width: 145,
              height: 150,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      offset: Offset(1, 2),
                      blurRadius: 8,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 74,
                    width: 74,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: colorList[index],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Medicine",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
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
          onPressed: showCategoryBottomSheet,
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
                "Add Category",
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
