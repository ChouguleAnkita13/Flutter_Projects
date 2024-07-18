import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 243, 241, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 30, right: 30),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/user.png",
                      width: 48,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "welcome !",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(34, 31, 31, 1),
                          fontSize: 16),
                    ),
                    Text(
                      "Ruchita",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          color: const Color.fromRGBO(34, 31, 31, 1),
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "How is it going today ?",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(34, 31, 31, 0.4),
                          fontSize: 14),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.asset(
                    "assets/images/home.png",
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: TextField(
                      cursorColor: const Color.fromRGBO(34, 31, 31, 0.2),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 18,
                            color: Color.fromRGBO(34, 31, 31, 0.4),
                          ),
                          hintText: "   Search doctor, drugs, articles...",
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(34, 31, 31, 0.4),
                              fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(232, 243, 241, 1),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(232, 243, 241, 1),
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset("assets/images/group/doctor.png"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Top Doctors",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(34, 31, 31, 1),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset("assets/images/group/pharmacy.png"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pharmacy",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(34, 31, 31, 1),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset("assets/images/group/ambulance.png"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ambulance",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(34, 31, 31, 1),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Health article",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(34, 31, 31, 1),
                            fontSize: 16),
                      ),
                      Text(
                        "See all",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(64, 124, 226, 1),
                            fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
