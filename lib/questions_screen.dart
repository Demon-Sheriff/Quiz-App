import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen> {
  var currQuesIndex = 0;
  void incrementQuesIndex(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currQuesIndex == questions.length - 1) return;
      currQuesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final currentQuestion = questions[currQuesIndex];
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 76, 3, 125),
      ),
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.shuffleAnswers().map(
              (e) {
                return AnswerButton(e, () {
                  incrementQuesIndex(e);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
