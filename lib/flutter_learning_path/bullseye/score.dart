import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int totalScore;
  final int round;
  final VoidCallback onStartOver;
  const Score({
    super.key,
    required this.totalScore,
    required this.round,
    required this.onStartOver,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            onStartOver();
          },
          child: const Text("Start Over"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text("Score: "),
              Text("$totalScore"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text("Round: "),
              Text("$round"),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Info"),
        )
      ],
    );
  }
}
