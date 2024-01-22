import 'package:capacity_club_mobile_app/features/core/model/page_config.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonnalWorkoutPlanningPage extends StatelessWidget {
  const PersonnalWorkoutPlanningPage({super.key});

  static const pageConfig = PageConfig(
      icon: Icons.lock_clock,
      name: 'workout-planning',
      child: PersonnalWorkoutPlanningPage());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
    );
  }
}