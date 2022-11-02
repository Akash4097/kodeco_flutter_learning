import 'package:flutter/material.dart';
import 'text_style.dart';

class Prompt extends StatelessWidget {
  final int targetValue;

  const Prompt({
    super.key,
    required this.targetValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "PUT THE BULLSEYE AS CLOSE AS YOU CAN TO",
          style: LabelTextStyle.bodyText1(context),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "$targetValue",
            style: TargetTextStyle.bodyText1(context),
          ),
        )
      ],
    );
  }
}
