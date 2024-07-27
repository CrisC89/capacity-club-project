import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:flutter/material.dart';

Widget bookIndividualIndoorTrainingButton(VoidCallback onPressed) {
  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);
  return TextButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return _mainColor.withOpacity(0.8);
          }
          return _mainColor;
        },
      ),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      )),
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 18)),
    ),
    onPressed: onPressed,
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Book Now',
        style: AppTheme.whiteTypeMedium14,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
