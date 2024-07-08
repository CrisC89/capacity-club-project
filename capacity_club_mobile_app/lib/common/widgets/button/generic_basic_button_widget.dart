import 'package:flutter/material.dart';

class GenericBasicButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color textColor;
  final Color backgroundColor;
  final String text;

  const GenericBasicButton({
    super.key,
    required this.onTap,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Audiowide',
          ),
        ),
      ),
    );
  }
}
