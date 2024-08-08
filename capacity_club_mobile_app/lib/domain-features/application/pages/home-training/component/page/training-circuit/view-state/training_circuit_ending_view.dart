import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme_color.dart';
import 'package:flutter/material.dart';

class TrainingCircuitEndingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: ThemeColor.mainColor,
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Finish Circuit',
                      style: AppTheme.whiteTypeMedium14,
                      textAlign: TextAlign.center)))),
    );
  }
}
