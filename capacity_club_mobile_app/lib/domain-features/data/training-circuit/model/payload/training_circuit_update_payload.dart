import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/exercise_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:equatable/equatable.dart';

class TrainingCircuitUpdatePayload extends Equatable implements Payload {
  final UniqueId training_circuit_id;
  final String title;
  final List<ExerciseTrainingModel> exercise_training_list;
  final WorkoutModel workout;

  const TrainingCircuitUpdatePayload({
    required this.training_circuit_id,
    required this.title,
    required this.exercise_training_list,
    required this.workout,
  });

  Map<String, dynamic> toJson() => {
        'training_circuit_id': training_circuit_id.toJson(),
        'title': title,
        'exercise_training_list':
            exercise_training_list.map((item) => item.toJson()).toList(),
        'workout': workout.toJson(),
      };

  @override
  List<Object?> get props =>
      [training_circuit_id, title, exercise_training_list, workout];
}
