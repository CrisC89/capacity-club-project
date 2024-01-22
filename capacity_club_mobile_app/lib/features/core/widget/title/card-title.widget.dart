import 'package:flutter/material.dart';

Text cardTitle(String text, BuildContext context) {
  return Text(text.toUpperCase(),
      style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 2));
}
