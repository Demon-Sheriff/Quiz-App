import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final VoidCallback pressFunction;
  const StartButton({super.key, required this.pressFunction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: pressFunction,
      style: ElevatedButton.styleFrom(),
      icon: const Icon(
        Icons.arrow_right_alt_outlined,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      label: const Text(
        'Start',
        style: TextStyle(
          color: const Color.fromARGB(255, 5, 2, 151),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
