import 'package:expense_manager_app/category_screen.dart';
import 'package:expense_manager_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMenuDrawer extends StatefulWidget {
  const MyMenuDrawer({super.key});

  @override
  State<MyMenuDrawer> createState() => _MyMenuDrawerState();
}

class _MyMenuDrawerState extends State<MyMenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
      surfaceTintColor: const Color.fromRGBO(255, 255, 255, 1),
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      width: 216,
      child: Padding(
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
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: (){
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
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: (){},

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
              const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: (){
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
                const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: (){},

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
                  const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: (){},
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
            
          ],
        ),
      ),
    );
  }
}
