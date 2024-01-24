import 'package:capacity_club_mobile_app/features/core/module/exercise-training/domain/entity/exercise-training.entity.dart';

class TrainingCircuit {
  final String training_circuit_id;
  final String title;
  final List<ExerciseTraining> exercise_training_list;

  TrainingCircuit(
      {required this.training_circuit_id,
      required this.title,
      required this.exercise_training_list});

  factory TrainingCircuit.empty() {
    return TrainingCircuit(
        training_circuit_id: '', title: '', exercise_training_list: []);
  }
}
