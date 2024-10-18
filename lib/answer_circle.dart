import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/user_summary.dart';

class AnswerCircle extends StatefulWidget {
  final UserSummary currentUserSummary;
  const AnswerCircle({super.key, required this.currentUserSummary});

  @override
  State<AnswerCircle> createState() {
    return _AnswerCirlce();
  }
}

class _AnswerCirlce extends State<AnswerCircle> {
  String currentColor = 'red';

  @override
  Widget build(BuildContext context) {
    if (widget.currentUserSummary.userAnswer ==
        questions[widget.currentUserSummary.questionIndex].options[0]) {
      currentColor = 'green';
    } else {
      currentColor = 'red';
    }

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.cyanAccent),
        color: currentColor == 'red' ? Colors.red : Colors.green,
      ),
      child: Text(
        textAlign: TextAlign.center,
        (widget.currentUserSummary.questionIndex + 1).toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
