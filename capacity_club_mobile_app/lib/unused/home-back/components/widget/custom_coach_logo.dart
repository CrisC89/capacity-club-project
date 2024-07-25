import 'package:flutter/material.dart';

class CustomCoachLogo2 extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final double radius;
  final TextStyle textStyle;

  const CustomCoachLogo2({
    super.key,
    required this.backgroundColor,
    required this.text,
    this.radius = 40,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Audiowide',
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
