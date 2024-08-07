import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-data/entity/exercise_data_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/entity/training_circuit_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/enum/training_intensity.dart';

class ExerciseTrainingEntity {
  final UniqueId exercise_training_id;
  final int nb_reps;
  final String intensity;
  final TrainingIntensity intensityType;
  final ExerciseDataEntity exercise_data;
  final bool is_empty;

  ExerciseTrainingEntity(
      {required this.exercise_training_id,
      required this.nb_reps,
      required this.intensity,
      required this.intensityType,
      required this.exercise_data,
      required this.is_empty});

  factory ExerciseTrainingEntity.empty() {
    return ExerciseTrainingEntity(
        exercise_training_id: UniqueId(''),
        nb_reps: 0,
        intensity: '',
        intensityType: TrainingIntensity.none,
        exercise_data: ExerciseDataEntity.empty(),
        is_empty: true);
  }
}
