import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final String text;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;
  const FilterWidget({
    super.key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16.0),
        )
      ],
    );
  }
}
