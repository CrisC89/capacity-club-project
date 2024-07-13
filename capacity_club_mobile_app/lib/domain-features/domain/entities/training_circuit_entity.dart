import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/entities/exercise_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/entities/workout_entity.dart';

class TrainingCircuitEntity {
  final UniqueId training_circuit_id;
  final String title;
  final List<ExerciseTrainingEntity> exercise_training_list;
  final WorkoutEntity workout;

  TrainingCircuitEntity(
      {required this.training_circuit_id,
      required this.title,
      required this.exercise_training_list,
      required this.workout});

  factory TrainingCircuitEntity.empty() {
    return TrainingCircuitEntity(
        training_circuit_id: UniqueId(''),
        title: '',
        exercise_training_list: [],
        workout: WorkoutEntity.empty());
  }
}
