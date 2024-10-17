import 'package:flutter/material.dart';
import 'package:quiz_app/start_button.dart';

class StartQuizPage extends StatelessWidget {
  final VoidCallback changeStateFunction;
  const StartQuizPage({super.key, required this.changeStateFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 72, 55, 198),
          Color.fromARGB(245, 7, 3, 39)
        ]),
      ),
      // color: Colors.purple.shade900,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/quiz-logo.png',
                width: MediaQuery.of(context).size.width * 0.7,
                color: const Color.fromARGB(255, 255, 255, 255)),
            const SizedBox(height: 40),
            const Flexible(
              child: Text(
                'Learn Flutter the fun way',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  // maxLines: 1, // Text will take up only 1 line
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            StartButton(
              pressFunction: () {
                changeStateFunction();
              },
            ),
          ],
        ),
      ),
    );
  }
}
