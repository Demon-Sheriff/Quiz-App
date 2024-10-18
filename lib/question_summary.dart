import 'package:flutter/material.dart';
import 'package:quiz_app/answer_circle.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/user_summary.dart';

class QuestionSummary extends StatelessWidget {
  List<UserSummary> userSummaryData;
  QuestionSummary({super.key, required this.userSummaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            ...userSummaryData.map(
              (element) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnswerCircle(currentUserSummary: element),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // Display the question
                            element.quizQuestion.question,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            // Display the User's answer
                            element.userAnswer,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 238, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            // Display the Correct Answer of the question
                            questions[element.questionIndex].options[0],
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 255, 76),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
