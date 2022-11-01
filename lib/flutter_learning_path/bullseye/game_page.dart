import 'dart:math';

import 'package:flutter/material.dart';

import 'control.dart';
import 'game_model.dart';
import 'prompt.dart';
import 'score.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(Random().nextInt(100) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Prompt(targetValue: _model.target),
            Control(model: _model),
            TextButton(
              onPressed: showAlert,
              child: const Text("Hit me"),
            ),
            Score(
              totalScore: _model.totalScore,
              round: _model.round,
            ),
          ],
        ),
      ),
    );
  }

  int _pointsForCurrentRound() {
    const int maximumScore = 100;
    final difference = (_model.current - _model.target).abs();
    return maximumScore - difference;
  }

  void showAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Title"),
          content: Text(
            "The Slider's value is ${_model.current}\n"
            "You scored ${_pointsForCurrentRound()} points this round",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Awesome"),
            )
          ],
        );
      },
    );
  }
}
