import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/exercise_data_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/enum/training_intensity.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';

class ExerciseTrainingFilter {
  final int? nb_reps;
  final String? intensity;
  final TrainingIntensity? intensityType;
  final ExerciseDataModel? exercise_data;
  final TrainingCircuitModel? training_circuit;

  ExerciseTrainingFilter({
    this.nb_reps,
    this.intensity,
    this.intensityType,
    this.exercise_data,
    this.training_circuit,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json.addIfNotNull('nb_reps', nb_reps);
    json.addIfNotNull('intensity', intensity);
    json.addIfNotNull('intensityType', intensityType?.toJson());
    json.addIfNotNull('exercise_data', exercise_data?.toJson());
    json.addIfNotNull('training_circuit', training_circuit?.toJson());
    return json;
  }
}
