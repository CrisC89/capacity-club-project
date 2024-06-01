import 'package:flutter/material.dart';

TextButton basicButton(
    String first, Function callback, Color backgroundColor, Color fontColor) {
  return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.all(5),
          backgroundColor: backgroundColor,
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Titillium',
              color: fontColor),
          minimumSize: const Size.fromHeight(30),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero))),
      onPressed: () => callback(),
      child: Padding(
          padding: const EdgeInsets.all(8), //apply padding to all four sides
          child: Text(
            first.toUpperCase(),
            style: TextStyle(fontSize: 15, letterSpacing: 2, color: fontColor),
          )));
}
