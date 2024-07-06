import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:flutter/material.dart';

TextButton blackButton(String first, Function callback, bool isDarkMode) {
  return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: isDarkMode ? Colors.grey : Colors.black,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.all(5),
          backgroundColor: Colors.grey,
          textStyle: AppTheme.whiteTypeMedium14,
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
