import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme_color.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/widget/training_day_step_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/home_training_page.dart';
import 'package:flutter/material.dart';

Widget trainingWeekStepper(Week week) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Semaine ${week.weekNumber}',
            style: AppTheme.dustyGrayMedium20,
          ),
          SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 20,
                child: Container(
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  week.sessions.length,
                  (sessionIndex) {
                    final session = week.sessions[sessionIndex];
                    final sessionDay = sessionIndex + 1;
                    return trainingDayStep(session, sessionDay);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
