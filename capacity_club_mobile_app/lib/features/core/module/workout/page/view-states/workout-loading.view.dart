import 'package:flutter/material.dart';

class WorkoutLoadingView extends StatelessWidget {
  const WorkoutLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
