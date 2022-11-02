import 'dart:math';
import 'package:flutter/material.dart';
import 'control.dart';
import 'game_model.dart';
import 'hitme_button.dart';
import 'prompt.dart';
import 'score.dart';
import 'styled_button.dart';

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
    _model = GameModel(_newTargetValue());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 48.0,
                  bottom: 32.0,
                ),
                child: Prompt(targetValue: _model.target),
              ),
              Control(model: _model),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: HitMeButton(
                  onPressed: () {
                    _showAlert();
                  },
                  text: "Hit me",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Score(
                  totalScore: _model.totalScore,
                  round: _model.round,
                  onStartOver: _startNewGame,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int get _differenceAmount => (_model.target - _model.current).abs();

  int _newTargetValue() => Random().nextInt(100) + 1;

  void _startNewGame() {
    setState(() {
      _model.current = GameModel.sliderStart;
      _model.totalScore = GameModel.scoreStart;
      _model.round = GameModel.roundStart;
      _model.target = _newTargetValue();
    });
  }

  int _pointsForCurrentRound() {
    const int maximumScore = 100;
    int bonus = 0;
    final difference = _differenceAmount;

    if (difference == 0) {
      bonus = 100;
    } else if (difference == 1) {
      bonus = 50;
    }
    return maximumScore - difference + bonus;
  }

  String _getAlertTitle() {
    final difference = _differenceAmount;
    String title;

    if (difference == 0) {
      title = "Perfect!";
    } else if (difference < 5) {
      title = "You almost had it!";
    } else if (difference <= 10) {
      title = "Not bad";
    } else {
      title = "Are you even trying?";
    }
    return title;
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(_getAlertTitle()),
          content: Text(
            "The Slider's value is ${_model.current}\n"
            "You scored ${_pointsForCurrentRound()} points this round",
          ),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _model.totalScore += _pointsForCurrentRound();
                  _model.target = _newTargetValue();
                  _model.round++;
                });
              },
              icon: Icons.close,
            )
          ],
        );
      },
    );
  }
}
