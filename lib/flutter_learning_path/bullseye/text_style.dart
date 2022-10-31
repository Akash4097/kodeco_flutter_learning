import 'package:flutter/material.dart';

class LabelTextStyle {
  static TextStyle? bodyText1(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 2.0,
        );
  }
}
