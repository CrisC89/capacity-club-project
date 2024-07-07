import 'package:flutter/material.dart';

Widget fullLabel() {
  final Color _labelColor = const Color(0xffffeae9);
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: _labelColor),
    child: Text('Full',
        style: TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Audiowide')),
  );
}
