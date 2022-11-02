import 'package:flutter/material.dart';

class HitMeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const HitMeButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.red[700],
      splashColor: Colors.redAccent,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          text,
          maxLines: 1,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }
}
