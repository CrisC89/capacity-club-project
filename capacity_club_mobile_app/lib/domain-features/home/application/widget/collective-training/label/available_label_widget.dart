import 'package:flutter/material.dart';

Widget availableLabel() {
  //final Color _labelColor = const Color(0xffe9fbf8);
  //final Color _labelColor = const Color(0xff87f5df);
  final Color _labelColor = Color.fromARGB(255, 144, 245, 198);
  //final Color _labelTextColor = const Color(0xff44cdb3);
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: _labelColor),
    child: Text('Available',
        style: TextStyle(
            color: Colors.green,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Audiowide')),
  );
}
