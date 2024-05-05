import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/BG.png")),
            color: Color.fromRGBO(250, 245, 241, 1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
          child: Column(
            children: [
              Text(
                "Quiz Result",
                style: GoogleFonts.dmSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color.fromRGBO(131, 76, 52, 1)),
                ),
              ),
              Text(
                "Math",
                style: GoogleFonts.dmSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color.fromRGBO(131, 76, 52, 1)),
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 334,
                    width: 311,
                    margin: const EdgeInsets.only(top: 150),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(246, 221, 195, 1)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 300,
                            // height: 105,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      blurRadius: 8,
                                      offset: Offset.zero),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromRGBO(248, 145, 87, 1)),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total won quiz's till now",
                                      style: GoogleFonts.dmSans(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                      width: 175,
                                      child: Text(
                                        "Lorem Ipsum has been the industry's standard dummy scrambled it to make a type specimen book.",
                                        style: GoogleFonts.dmSans(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 1)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // const Spacer(),
                                SizedBox(
                                  width: 62,
                                  height: 62,
                                  child: CircularPercentIndicator(
                                    radius: 20, // width: 300,
                                    lineWidth: 8.0,
                                    percent: 0.8,

                                    backgroundWidth: 0,
                                    fillColor: Colors.transparent,
                                    center: Text(
                                      "68%",
                                      style: GoogleFonts.dmSans(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                      ),
                                    ),
                                    arcType: ArcType.FULL,
                                    arcBackgroundColor:
                                        const Color.fromRGBO(255, 250, 246, 1),
                                    progressColor:
                                        const Color.fromRGBO(255, 250, 246, 1),
                                  ),
                                ),
                                // Expanded(
                                //   child: Container(
                                //     width: 45,
                                //     height: 45,
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(8),
                                //         color: const Color.fromRGBO(
                                //             255, 255, 255, 1)),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 137,
                                height: 95,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1),
                                          blurRadius: 8,
                                          offset: Offset.zero),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromRGBO(250, 245, 241, 1)),
                                child: SizedBox(
                                  width: 63,
                                  // height: 65,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Solved  Questions",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.dmSans(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                131, 76, 52, 0.9),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "20",
                                        style: GoogleFonts.dmSans(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color:
                                                Color.fromRGBO(131, 76, 52, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 137,
                                height: 95,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.1),
                                          blurRadius: 8,
                                          offset: Offset.zero),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromRGBO(26, 181, 134, 1)),
                                child: SizedBox(
                                  width: 63,
                                  // height: 65,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Correct Questions",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.dmSans(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.87),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "16",
                                        style: GoogleFonts.dmSans(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Container(
                      width: 85,
                      height: 85,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromRGBO(250, 245, 241, 1)),
                      child: Text(
                        "M",
                        // textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                            color: Color.fromRGBO(200, 60, 0, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
