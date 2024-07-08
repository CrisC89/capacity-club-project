import 'package:flutter/material.dart';

class GenericLabel extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;

  const GenericLabel({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: backgroundColor),
      child: Text(text,
          style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Audiowide')),
    );
  }
}
