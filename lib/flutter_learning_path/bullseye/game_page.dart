import 'dart:math';
import 'package:flutter/material.dart';
import 'game_model.dart';
import 'score.dart';
import 'control.dart';
import 'prompt.dart';

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
              onPressed: () {},
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
}
