import 'package:flutter/material.dart';

TextButton blackButton(String first, Function callback) {
  return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.all(5),
          backgroundColor: Colors.black,
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Titillium',
              color: Colors.white),
          minimumSize: const Size.fromHeight(30),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero))),
      onPressed: () => callback(),
      child: Padding(
        padding: const EdgeInsets.all(8), //apply padding to all four sides
        child: Text(first.toUpperCase(),
            style:
                TextStyle(fontSize: 15, letterSpacing: 2, color: Colors.white)),
      ));
}
