import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/entities/exercise_data_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/entities/training_circuit_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/enum/training_intensity.dart';

class ExerciseTrainingEntity {
  final UniqueId exercise_training_id;
  final int nb_reps;
  final String intensity;
  final TrainingIntensity intensityType;
  final ExerciseDataEntity exercise_data;
  final TrainingCircuitEntity training_circuit;

  ExerciseTrainingEntity(
      {required this.exercise_training_id,
      required this.nb_reps,
      required this.intensity,
      required this.intensityType,
      required this.exercise_data,
      required this.training_circuit});

  factory ExerciseTrainingEntity.empty() {
    return ExerciseTrainingEntity(
        exercise_training_id: UniqueId(''),
        nb_reps: 0,
        intensity: '',
        intensityType: TrainingIntensity.none,
        exercise_data: ExerciseDataEntity.empty(),
        training_circuit: TrainingCircuitEntity.empty());
  }
}
