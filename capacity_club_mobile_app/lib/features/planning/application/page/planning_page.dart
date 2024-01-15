import 'package:capacity_club_mobile_app/features/core/model/page_config.dart';
import 'package:flutter/material.dart';

class PlanningPage extends StatelessWidget {
  const PlanningPage({super.key});

  static const pageConfig = PageConfig(
      icon: Icons.lock_clock, name: 'planning', child: PlanningPage());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
    );
  }
}
