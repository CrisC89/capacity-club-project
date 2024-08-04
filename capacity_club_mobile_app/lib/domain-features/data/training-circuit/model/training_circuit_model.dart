import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/exercise_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/mapper/training_circuit_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:equatable/equatable.dart';

class TrainingCircuitModel extends Equatable {
  final UniqueId training_circuit_id;
  final String title;
  final List<ExerciseTrainingModel> exercise_training_list;
  final WorkoutModel? workout;

  TrainingCircuitModel(
      {required this.training_circuit_id,
      required this.title,
      required this.exercise_training_list,
      required this.workout});

  factory TrainingCircuitModel.fromJson(Map<String, dynamic> json) {
    return TrainingCircuitMapper.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return TrainingCircuitMapper.toJson(this);
  }

  @override
  List<Object?> get props =>
      [training_circuit_id, title, exercise_training_list, workout];
}
