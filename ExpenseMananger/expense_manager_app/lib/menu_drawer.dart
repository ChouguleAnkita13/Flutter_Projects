import 'package:expense_manager_app/category_screen.dart';
import 'package:expense_manager_app/graph_screen.dart';
import 'package:expense_manager_app/home_screen.dart';
import 'package:expense_manager_app/trash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMenuDrawer extends StatefulWidget {
  const MyMenuDrawer({super.key});

  @override
  State<MyMenuDrawer> createState() => _MyMenuDrawerState();
}

class _MyMenuDrawerState extends State<MyMenuDrawer> {
  int selectedMenu = 1;
  Color chooseMenu(int menuNum) {
    if (selectedMenu == menuNum) {
      return const Color.fromRGBO(14, 161, 125, 0.15);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      surfaceTintColor: const Color.fromRGBO(255, 255, 255, 1),
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      width: 216,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Expense Manager",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Saves all your Transactions",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 184,
            height: 40,
            padding: const EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                color: chooseMenu(1),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedMenu = 1;
                });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: Row(
                children: [
                  Image.asset("assets/images/drawer/transaction.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Transaction",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: selectedMenu == 1
                            ? const Color.fromRGBO(14, 161, 125, 1)
                            : const Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 184,
            height: 40,
            padding: const EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                color: chooseMenu(2),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedMenu = 2;
                });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GraphScreen()));
              },
              child: Row(
                children: [
                  Image.asset("assets/images/drawer/graph.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Graph",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 184,
            height: 40,
            padding: const EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                color: chooseMenu(3),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedMenu = 3;
                });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CategoryScreen()));
              },
              child: Row(
                children: [
                  Image.asset("assets/images/drawer/category.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Category",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 184,
            height: 40,
            padding: const EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                color: chooseMenu(4),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedMenu = 4;
                });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TrashScreen()));
              },
              child: Row(
                children: [
                  Image.asset("assets/images/drawer/trash.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Trash",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 184,
            height: 40,
            padding: const EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                color: chooseMenu(5),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedMenu = 5;
                });
              },
              child: Row(
                children: [
                  Image.asset("assets/images/drawer/about.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "About Us",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
