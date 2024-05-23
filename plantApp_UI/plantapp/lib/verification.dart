import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/home.dart';
import 'package:plantapp/login.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});
  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              const Spacer(),
              Transform.translate(
                  offset: const Offset(0.0, -30.0),
                  child: Image.asset("assets/images/Group2.png")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 46,
                  width: 278,
                  child: Text(
                    "Enter the OTP code from the phone we just sent you.",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 56,
                  width: 320,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 56,
                        margin: const EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromRGBO(204, 211, 196, 1)),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.06),
                                offset: Offset(0, 8),
                                blurRadius: 20)
                          ],
                          color: Colors.white,
                        ),
                        child: const TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "Don’t receive OTP code! ",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                  TextSpan(
                    text: "Resend",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  )
                ])),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 320,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                              offset: Offset(0, 20),
                              blurRadius: 40)
                        ],
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(62, 102, 24, 1),
                              Color.fromRGBO(124, 180, 70, 1)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
