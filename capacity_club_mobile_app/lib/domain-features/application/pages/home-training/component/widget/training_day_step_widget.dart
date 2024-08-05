import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme_color.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/home_training_page.dart';
import 'package:flutter/material.dart';

Widget trainingDayStep(TrainingSession session, int sessionDay) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color:
              session.isCompleted ? ThemeColor.mainColor : ThemeColor.dustyGray,
        ),
        child: Center(
            child: Text(sessionDay.toString(),
                style: AppTheme.whiteTypeMedium16))),
  );
}
