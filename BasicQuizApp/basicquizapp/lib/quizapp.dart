import 'package:flutter/material.dart';

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  List allQuestions = [
    const SingleQuestionModel(
        question: "The first alpha version of Flutter was released in?",
        options: ["2016", "2017", "2018", "2019"],
        answerIndex: 1),
    const SingleQuestionModel(
        question:
            "Who developed the Flutter Framework and continues to maintain it today?",
        options: ["Facebook", "Microsoft", "Google", "Oracle"],
        answerIndex: 2),
    const SingleQuestionModel(
        question:
            "Which programming language is used to build Flutter applications?",
        options: ["Dart", "Java", "Kotlin", "C.Go"],
        answerIndex: 0),
    const SingleQuestionModel(
        question: "How many types of widgets are there in Flutter?",
        options: ["6", "4", "3", "2"],
        answerIndex: 3),
    const SingleQuestionModel(
        question:
            "A widget that allows us to refresh the screen is called a ____________.",
        options: [
          "Stateless widgets",
          "Stateful widget",
          "Statebuild widget",
          "All of the above"
        ],
        answerIndex: 1),
  ];
  String activeScreen = "startScreen";
  int questionIndex = 0;
  int countCorrectAnswers = 0;
  int selectedOption = -1;

  MaterialStateProperty<Color> checkAnswer(int buttonIndex) {
    if (selectedOption != -1) {
      if (buttonIndex == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedOption) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.white);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.white);
    }
  }

  void validateCurrentPage() {
    if (selectedOption == -1) {
      return;
    }
    if (selectedOption == allQuestions[questionIndex].answerIndex) {
      countCorrectAnswers += 1;
    }
    setState(() {
      if (questionIndex == allQuestions.length - 1) {
        activeScreen = "resultScreen";
      }
      questionIndex++;
      selectedOption = -1;
    });
  }

  Scaffold isQuestionScreen() {
    if (activeScreen == "startScreen") {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 16, 103, 128),
            Color.fromARGB(255, 44, 129, 146)
          ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/img.png",
                  color: const Color.fromARGB(255, 155, 184, 190), height: 400),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Quiz to train your knowledge!",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      activeScreen = "questionScreen";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(200, 30),
                    foregroundColor: const Color.fromARGB(255, 16, 103, 128),
                  ),
                  child: const Text(
                    "Start Quiz",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
            ],
          ),
        ),
      );
    } else if (activeScreen == "questionScreen") {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 16, 103, 128),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question : ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              // width: 380,
              child: Text(
                allQuestions[questionIndex].question,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedOption == -1) {
                    selectedOption = 0;
                  }
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(300, 30)),
                backgroundColor: checkAnswer(0),
                foregroundColor: const MaterialStatePropertyAll(Colors.black),
              ),
              child: Text(
                "A. ${allQuestions[questionIndex].options[0]}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedOption == -1) {
                    selectedOption = 1;
                  }
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(300, 30)),
                backgroundColor: checkAnswer(1),
                foregroundColor: const MaterialStatePropertyAll(Colors.black),
              ),
              child: Text(
                "B. ${allQuestions[questionIndex].options[1]}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedOption == -1) {
                    selectedOption = 2;
                  }
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(300, 30)),
                backgroundColor: checkAnswer(2),
                foregroundColor: const MaterialStatePropertyAll(Colors.black),
              ),
              child: Text(
                "C. ${allQuestions[questionIndex].options[2]}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedOption == -1) {
                    selectedOption = 3;
                  }
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(300, 30)),
                backgroundColor: checkAnswer(3),
                foregroundColor: const MaterialStatePropertyAll(Colors.black),
              ),
              child: Text(
                "D. ${allQuestions[questionIndex].options[3]}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: validateCurrentPage,
          backgroundColor: const Color.fromARGB(255, 16, 103, 128),
          child: const Icon(
            Icons.forward,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 16, 103, 128),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/trophy.jpg",
              width: 500,
              height: 300,
            ),
             const SizedBox(
              height: 15,
            ),
            const Text(
              "Congratulations!!!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "You have successfully completed your quiz",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Your Score",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "$countCorrectAnswers / ${allQuestions.length}",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionIndex = 0;
                    countCorrectAnswers = 0;
                    activeScreen = "questionScreen";
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 16, 103, 128),
                  fixedSize: const Size(120, 30),
                ),
                child: const Text(
                  "Restart",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
