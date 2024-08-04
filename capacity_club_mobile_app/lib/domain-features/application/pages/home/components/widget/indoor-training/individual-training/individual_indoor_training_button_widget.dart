import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:flutter/material.dart';

Widget individualIndoorTrainingButton(BuildContext context, String buttonValue,
    String currentTimeVal, VoidCallback onTap) {
  final double size = (MediaQuery.of(context).size.width - 64 - (16 * 3)) / 4;

  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: size,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: currentTimeVal == buttonValue
              ? _mainColor
              : Theme.of(context).colorScheme.secondaryContainer),
      child: Center(
          child: Text(buttonValue,
              style: currentTimeVal == buttonValue
                  ? AppTheme.whiteTypeMedium16
                  : AppTheme.dustyGrayMedium16)),
    ),
  );
}


/*

() {
      setState(() {
        timeVal = value;
      });
    }

*/