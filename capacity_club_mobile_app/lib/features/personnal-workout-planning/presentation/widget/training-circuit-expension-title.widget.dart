import 'package:capacity_club_mobile_app/features/core/module/training-circuit/domain/entity/training-circuit.entity.dart';
import 'package:flutter/material.dart';

class TrainingCircuitExpansionTitle extends StatelessWidget {
  final TrainingCircuit training_circuit;

  const TrainingCircuitExpansionTitle(
      {super.key, required this.training_circuit});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionTile(
            title: Text(training_circuit.title.toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2)),
            children: training_circuit.exercise_training_list
                .map((exercise) => ListTile(
                      title: Text(exercise.title.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2)),
                    ))
                .toList()),
      ),
    );
  }
}
