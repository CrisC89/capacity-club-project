import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/exercise_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:equatable/equatable.dart';

class TrainingCircuitModel extends Equatable {
  final UniqueId training_circuit_id;
  final String title;
  final List<ExerciseTrainingModel> exercise_training_list;
  final WorkoutModel workout;

  TrainingCircuitModel(
      {required this.training_circuit_id,
      required this.title,
      required this.exercise_training_list,
      required this.workout});

  factory TrainingCircuitModel.fromJson(Map<String, dynamic> json) {
    return TrainingCircuitModel(
        training_circuit_id: json['training_circuit_id'],
        title: json['title'],
        exercise_training_list: json['exercise_training_list'],
        workout: json['workout']);
  }

  Map<String, dynamic> toJson() => {
        'training_circuit_id': training_circuit_id,
        'title': title,
        'exercise_training_list': exercise_training_list,
        'workout': workout
      };

  @override
  List<Object?> get props =>
      [training_circuit_id, title, exercise_training_list, workout];
}
