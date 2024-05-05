import 'package:advance_quiz_app/view/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List subjectList = [
    {
      'initial': "M",
      'name': "Math",
      'color': const Color.fromRGBO(200, 60, 0, 1),
    },
    {
      'initial': "H",
      'name': "History",
      'color': const Color.fromRGBO(255, 157, 66, 1),
    },
    {
      'initial': "G",
      'name': "Geography",
      'color': const Color.fromRGBO(3, 163, 134, 1),
    },
    {
      'initial': "B",
      'name': "Biology",
      'color': const Color.fromRGBO(251, 43, 255, 1),
    },
    {
      'initial': "S",
      'name': "Sports",
      'color': const Color.fromRGBO(45, 104, 255, 1),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25, top: 60),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Ankita,",
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Color.fromRGBO(131, 76, 52, 1)),
                      ),
                    ),
                    Text(
                      "Great to see you again!",
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color.fromRGBO(131, 76, 52, 1)),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromRGBO(250, 188, 154, 1)),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: subjectList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const QuestionScreen()));
                      },
                      child: Container(
                        // width: 306,
                        height: 80,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(255, 237, 217, 1)),
                        child: Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                              child: Text(
                                subjectList[index]['initial'],
                                style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: subjectList[index]['color'],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              subjectList[index]['name'],
                              style: GoogleFonts.dmSans(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color.fromRGBO(131, 76, 52, 1)),
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios,
                                size: 20,
                                weight: 2.5,
                                color: Color.fromRGBO(52, 10, 0, 1)),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
