import 'package:capacity_club_mobile_app/features/core/module/exercise-training/domain/entity/exercise-training.entity.dart';

class TrainingCircuitDto {
  final String training_circuit_id;
  final String title;
  final List<ExerciseTraining> exercise_training_list;

  TrainingCircuitDto(
      {required this.training_circuit_id,
      required this.title,
      required this.exercise_training_list});

  factory TrainingCircuitDto.fromJson(Map<String, dynamic> json) {
    return TrainingCircuitDto(
        training_circuit_id: json['training_circuit_id'],
        title: json['title'],
        exercise_training_list: json['exercise_training_list']);
  }

  Map<String, dynamic> toJson() => {
        'training_circuit_id': training_circuit_id,
        'title': title,
        'exercise_training_list': exercise_training_list,
      };
}
