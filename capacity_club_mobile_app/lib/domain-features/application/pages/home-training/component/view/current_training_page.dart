import 'dart:math';

import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/widget/rounded_progress_bar_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/widget/training_week_stepper_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/home_training_page.dart';
import 'package:flutter/material.dart';

class CurrentTrainingPage extends StatelessWidget {
  CurrentTrainingPage({super.key});
  final List<Week> weeks = List.generate(4, (weekIndex) {
    return Week(
      weekNumber: weekIndex + 1,
      sessions: List.generate(7, (sessionIndex) {
        return TrainingSession(isCompleted: Random().nextBool());
      }),
    );
  });

  void _openSession(int weekIndex, int sessionIndex) {
    print('Opening session ${sessionIndex + 1} of week ${weekIndex + 1}');
  }

  double _calculateProgress() {
    int completedSessions = 0;
    int totalSessions = 0;
    for (var week in weeks) {
      for (var session in week.sessions) {
        if (session.isCompleted) {
          completedSessions++;
        }
        totalSessions++;
      }
    }
    return completedSessions / totalSessions;
  }

  @override
  Widget build(BuildContext context) {
    double progress = _calculateProgress();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Progression Globale
              Center(child: roundedProgressBar(progress)),
              // Sessions par semaine
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: weeks.length,
                itemBuilder: (context, index) {
                  final week = weeks[index];
                  return trainingWeekStepper(week);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
