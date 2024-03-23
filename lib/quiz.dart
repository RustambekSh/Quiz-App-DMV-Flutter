import 'package:basics_1/data/questions.dart';
import 'package:basics_1/questions_screen.dart';
import 'package:basics_1/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:basics_1/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(
        () {
          activeScreen = ResultsScreen(
            choosenAnswers: selectedAnswers,
          );
        },
      );
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 79, 8, 82),
              Color.fromARGB(255, 199, 33, 205)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: activeScreen,
      )),
    );
  }
}
