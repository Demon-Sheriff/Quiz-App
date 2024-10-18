import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/models/user_summary.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatefulWidget {
  final List<String> answers;
  final void Function() onPress;
  const ResultScreen({super.key, required this.answers, required this.onPress});

  @override
  State<ResultScreen> createState() {
    return _ResultScreen();
  }
}

class _ResultScreen extends State<ResultScreen> {
  List<UserSummary> getSummaryOfQuiz() {
    List<UserSummary> userSummaryData = [];
    // print(widget.answers);
    for (var i = 0; i < widget.answers.length; i++) {
      userSummaryData.add(
        UserSummary(
          questionIndex: i,
          quizQuestion: QuizQuestion(
            questions[i].question,
            questions[i].options,
            questions[i].answerIndex,
          ),
          userAnswer: widget.answers[i],
        ),
      );
    }
    // print('Quiz Summary prepared !');
    // print(userSummaryData);
    return userSummaryData;
  }

  int getScore() {
    int score = 0;
    for (int i = 0; i < widget.answers.length; i++) {
      if (widget.answers[i] == questions[i].options[0]) score++;
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    // call the method to get the summary of the quiz.
    List<UserSummary> finalQuizSummary = getSummaryOfQuiz();
    // get the score of the user
    int score = getScore();
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 59, 4, 142),
      ),
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $score out of ${questions.length} questions correctly",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            QuestionSummary(userSummaryData: finalQuizSummary),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              icon: Icon(
                Icons.restart_alt_sharp,
              ),
              onPressed: widget.onPress,
              label: Text('Restart'),
            )
          ],
        ),
      ),
    );
  }
}
