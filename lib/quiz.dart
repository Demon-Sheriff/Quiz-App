import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_quiz.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> answerList = [];

  @override
  void initState() {
    super.initState();
    activeScreen = 'start-screen';
  }

  void selectAnswer(String answer) {
    answerList.add(answer);

    if (answerList.length == questions.length) {
      setState(() {
        // answerList = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      answerList = [];
      activeScreen = 'start-screen';
    });
  }

  void switchScreen() {
    print('Changing the page state to questions page');
    setState(() {
      activeScreen = 'question-screen';
      // const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: (activeScreen == 'start-screen')
            ? StartQuizPage(changeStateFunction: switchScreen)
            : (activeScreen == 'question-screen')
                ? QuestionsScreen(onSelectAnswer: selectAnswer)
                : ResultScreen(
                    answers: answerList,
                    onPress: restartQuiz,
                  ),
      ),
    );
  }
}
