import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const StyledButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.black,
      splashColor: Colors.redAccent,
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
