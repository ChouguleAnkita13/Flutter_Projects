
// import 'package:advance_quiz_app/view/splash_screen.dart';
import 'package:advance_quiz_app/view/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool isLast = false;
  List allQuestions = [
    1,
    1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 1,
    // 11,
    1
  ];
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 245, 241, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 26,
              width: 360,
              child: Text(
                "Math Quiz",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color.fromRGBO(131, 76, 52, 1)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            LinearPercentIndicator(
              // width: 300,
              lineHeight: 5.0,
              percent: 0.6,
              backgroundColor: const Color.fromRGBO(250, 188, 154, 1),
              barRadius: const Radius.circular(20),
              progressColor: const Color.fromRGBO(26, 181, 134, 1),

            ),
           
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                const SizedBox(width: 10,),
                Text(
                  "${questionIndex + 1}/",
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
                Text(
                  "${allQuestions.length}",
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // height: 108,
              width: 300,
              child: Text(
                  "If David’s age is 27 years old in 2011. What was his age in 2003?",
                  maxLines: 3,
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        color: Color.fromRGBO(131, 76, 52, 1)),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              // height: 350,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        // width: 306,
                        height: 70,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(248, 145, 87, 1)),
                        child: Row(
                          children: [
                            Text(
                              "19 years",
                              style: GoogleFonts.dmSans(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              weight: 2.5,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Text(
              "Explanation",
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color.fromRGBO(131, 76, 52, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SizedBox(
                width: 300,
                child: SingleChildScrollView(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing ",
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(131, 76, 52, 0.8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 35,
        width: 87,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8,
              offset: Offset.zero),
        ]),
        child: FloatingActionButton(
            onPressed: () {
              if (questionIndex != allQuestions.length - 1) {
                setState(() {
                  questionIndex++;
                });
              }
              if (questionIndex == allQuestions.length - 1) {
                setState(() {
                  isLast = true;
                });
              }
              if (isLast && questionIndex != allQuestions.length) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ResultScreen()));
              }
            },
            backgroundColor: const Color.fromRGBO(26, 181, 134, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: !isLast
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "NEXT",
                        style: GoogleFonts.dmSans(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: const Icon(Icons.arrow_forward,
                            size: 14, color: Color.fromRGBO(26, 181, 134, 1)),
                      )
                    ],
                  )
                : Text(
                    "FINISH",
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  )),
      ),
    );
  }
}
