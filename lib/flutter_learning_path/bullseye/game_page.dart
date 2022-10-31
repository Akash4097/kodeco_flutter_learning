import 'package:flutter/material.dart';
import 'package:kodeco_flutter_learning/flutter_learning_path/bullseye/game_model.dart';
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
    _model = GameModel(50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Prompt(targetValue: 100),
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
