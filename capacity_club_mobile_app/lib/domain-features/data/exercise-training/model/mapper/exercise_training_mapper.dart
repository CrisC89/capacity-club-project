import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/mapper/exercise_data_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/exercise_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/mapper/training_circuit_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-data/entity/exercise_data_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-training/exercise-data/entity/exercise_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/entity/training_circuit_entity.dart';

class ExerciseTrainingMapper {
  static ExerciseTrainingModel fromEntity(ExerciseTrainingEntity entity) {
    return ExerciseTrainingModel(
        exercise_training_id: entity.exercise_training_id,
        nb_reps: entity.nb_reps,
        intensity: entity.intensity,
        intensityType: entity.intensityType,
        exercise_data: entity.exercise_data.is_empty
            ? null
            : ExerciseDataMapper.fromEntity(entity.exercise_data),
        training_circuit: null);
  }

  static ExerciseTrainingModel fromJson(Map<String, dynamic> json) {
    return ExerciseTrainingModel(
        exercise_training_id: json['exercise_training_id'] != null
            ? UniqueId.fromJson(json['exercise_training_id'])
            : UniqueId(''),
        nb_reps: json['nb_reps'] ?? '',
        intensity: json['intensity'] ?? '',
        intensityType: json['intensityType'] ?? '',
        exercise_data:
            CommonHelperMethod.jsonContainsAndNotNullKey(json, 'exercise_data')
                ? ExerciseDataMapper.fromJson(json['exercise_data'])
                : null,
        training_circuit: CommonHelperMethod.jsonContainsAndNotNullKey(
                json, 'training_circuit')
            ? TrainingCircuitMapper.fromJson(json['training_circuit'])
            : null);
  }

  static ExerciseTrainingEntity toEntity(ExerciseTrainingModel model) {
    return ExerciseTrainingEntity(
        exercise_training_id: model.exercise_training_id,
        nb_reps: model.nb_reps,
        intensity: model.intensity,
        intensityType: model.intensityType,
        exercise_data: model.exercise_data != null
            ? ExerciseDataMapper.toEntity(model.exercise_data!)
            : ExerciseDataEntity.empty(),
        is_empty: false);
  }

  static Map<String, dynamic> toJson(ExerciseTrainingModel model) {
    return {
      'exercise_training_id': model.exercise_training_id.toJson(),
      'nb_reps': model.nb_reps,
      'intensity': model.intensity,
      'intensityType': model.intensityType,
      'exercise_data': model.exercise_data != null
          ? ExerciseDataMapper.toJson(model.exercise_data!)
          : {},
      'training_circuit': model.training_circuit != null
          ? TrainingCircuitMapper.toJson(model.training_circuit!)
          : {},
    };
  }
}
