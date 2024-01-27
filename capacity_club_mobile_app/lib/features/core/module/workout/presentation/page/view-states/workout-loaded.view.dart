import 'package:capacity_club_mobile_app/features/core/module/workout/domain/entity/workout.entity.dart';
import 'package:flutter/material.dart';

class WorkoutLoadedView extends StatelessWidget {
  final Workout workout;

  const WorkoutLoadedView({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(workout.title),
    );
  }
}
