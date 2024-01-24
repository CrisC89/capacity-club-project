import 'package:capacity_club_mobile_app/features/core/module/training-circuit/domain/entity/training-circuit.entity.dart';

class WorkoutDto {
  final String workout_id;
  final String title;
  final List<TrainingCircuit> training_circuits;

  const WorkoutDto(
      {required this.workout_id,
      required this.title,
      required this.training_circuits});

  factory WorkoutDto.fromJson(Map<String, dynamic> json) {
    return WorkoutDto(
        workout_id: json['workout_id'],
        title: json['title'],
        training_circuits: json['training_circuits']);
  }

  Map<String, dynamic> toJson() => {
        'workout_id': workout_id,
        'title': title,
        'training_circuits': training_circuits
      };
}
