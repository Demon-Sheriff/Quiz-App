import 'package:quiz_app/models/quiz_question.dart';

class UserSummary {
  int questionIndex;
  QuizQuestion quizQuestion;
  String userAnswer;

  @override
  UserSummary({required this.questionIndex, required this.quizQuestion, required this.userAnswer});
}