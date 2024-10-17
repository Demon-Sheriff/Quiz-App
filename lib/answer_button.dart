import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onPress;
  const AnswerButton(this.answerText, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
          backgroundColor: const Color.fromARGB(255, 17, 14, 90),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPress,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
