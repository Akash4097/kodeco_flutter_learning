import 'package:flutter/material.dart';
import 'styled_button.dart';
import 'text_style.dart';

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
        StyledButton(
          onPressed: () {
            onStartOver();
          },
          icon: Icons.refresh,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Text(
                  "Score: ",
                  style: LabelTextStyle.bodyText1(context),
                ),
                Text(
                  "$totalScore",
                  style: ScoreNumberTextStyle.headline4(context),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Text(
                  "Round: ",
                  style: LabelTextStyle.bodyText1(context),
                ),
                Text(
                  "$round",
                  style: ScoreNumberTextStyle.headline4(context),
                ),
              ],
            ),
          ),
        ),
        StyledButton(
          onPressed: () {},
          icon: Icons.info,
        )
      ],
    );
  }
}
