import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
  const FlatButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  final String text;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }
}
