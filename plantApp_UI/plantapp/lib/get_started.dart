import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/login.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 464,
            width: 360,
            child: Image.asset(
              "assets/images/getstarted.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 35),
            width: 249,
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enjoy your", style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w400)),),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "life with ",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w400)),
                  ),
                  TextSpan(
                    text: "Plants",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w600)),
                  ),
                ])),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, top: 40),
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  offset: Offset(0,20),
                  blurRadius: 40
                )],
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(62, 102, 24, 1),
                    Color.fromRGBO(124, 180, 70, 1)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Started",
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 5,),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 18,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
