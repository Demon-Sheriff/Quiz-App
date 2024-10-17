
class QuizQuestion {

  final String question;
  final List<String> options;
  final int answerIndex;

  QuizQuestion(this.question, this.options, this.answerIndex);

  List<String> shuffleAnswers() {
    List<String> temp = List.of(options);
    temp.shuffle();
    return temp;
  }
}