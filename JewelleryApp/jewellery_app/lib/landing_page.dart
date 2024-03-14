import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(12, 43, 99, 1),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, left: 15),
            width: 344,
            child: Text(
              "Jewells that suit your",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(192, 192, 192, 1),
                ),
              ),
            ),
          ),
          Container(
            height: 400,
            alignment: Alignment.bottomLeft,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
              "assets/images/landing.png",
            ))),
            child: Image.asset(
              "assets/images/style.png",
              height: 100,
            ),
          ),

          //
          Container(
            width: 216,
            height: 52,
            margin: const EdgeInsets.only(top: 60, left: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(192, 192, 192, 1),
                    offset: Offset(0, -2),
                    blurRadius: 4)
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Shop Now!!",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
