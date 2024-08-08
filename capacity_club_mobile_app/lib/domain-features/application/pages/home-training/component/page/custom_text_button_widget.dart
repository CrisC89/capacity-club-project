import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:flutter/material.dart';

Widget customTextButton({
  required VoidCallback onPressed,
  required String title,
  Color color = const Color.fromARGB(255, 4, 136, 183),
  double borderRadius = 3.0,
  TextStyle textStyle = AppTheme.whiteTypeMedium14,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      title,
      style: AppTheme.whiteTypeMedium14,
      textAlign: TextAlign.center,
    ),
  );
}
