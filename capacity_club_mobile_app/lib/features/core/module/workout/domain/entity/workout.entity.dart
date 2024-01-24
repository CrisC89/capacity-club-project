import 'package:capacity_club_mobile_app/features/core/module/training-circuit/domain/entity/training-circuit.entity.dart';

class Workout {
  final String workout_id;
  final String title;
  final List<TrainingCircuit> training_circuits;

  const Workout(
      {required this.workout_id,
      required this.title,
      required this.training_circuits});

  factory Workout.empty() {
    return const Workout(workout_id: '', title: '', training_circuits: []);
  }
}
