import 'package:flutter/material.dart';

class WorkoutErrorView extends StatelessWidget {
  const WorkoutErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Text('ERROR, please try again'),
    );
  }
}
