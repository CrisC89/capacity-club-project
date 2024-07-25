import 'package:flutter/material.dart';

class IconTextRow2 extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextRow2({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Icon(icon),
        ),
        SizedBox(
          width: 50,
          child: Text(text),
        ),
      ],
    );
  }
}
