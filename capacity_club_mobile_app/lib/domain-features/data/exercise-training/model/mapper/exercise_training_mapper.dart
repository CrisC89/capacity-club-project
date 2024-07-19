import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/mapper/exercise_data_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/exercise_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/mapper/training_circuit_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-training/exercise-data/entity/exercise_training_entity.dart';

class ExerciseTrainingMapper
    with Mapper<ExerciseTrainingModel, ExerciseTrainingEntity> {
  final ExerciseDataMapper exerciseDataMapper = ExerciseDataMapper();
  final TrainingCircuitMapper trainingCircuitMapper = TrainingCircuitMapper();

  @override
  ExerciseTrainingModel fromEntity(ExerciseTrainingEntity entity) {
    return ExerciseTrainingModel(
      exercise_training_id: entity.exercise_training_id,
      nb_reps: entity.nb_reps,
      intensity: entity.intensity,
      intensityType: entity.intensityType,
      exercise_data: exerciseDataMapper.fromEntity(entity.exercise_data),
      training_circuit:
          trainingCircuitMapper.fromEntity(entity.training_circuit),
    );
  }

  @override
  ExerciseTrainingModel fromJson(Map<String, dynamic> json) {
    return ExerciseTrainingModel(
      exercise_training_id: UniqueId(json['exercise_training_id']),
      nb_reps: json['nb_reps'],
      intensity: json['intensity'],
      intensityType: json['intensityType'],
      exercise_data: exerciseDataMapper.fromJson(json['exercise_data']),
      training_circuit:
          trainingCircuitMapper.fromJson(json['training_circuit']),
    );
  }

  @override
  ExerciseTrainingEntity toEntity(ExerciseTrainingModel model) {
    return ExerciseTrainingEntity(
      exercise_training_id: model.exercise_training_id,
      nb_reps: model.nb_reps,
      intensity: model.intensity,
      intensityType: model.intensityType,
      exercise_data: exerciseDataMapper.toEntity(model.exercise_data),
      training_circuit: trainingCircuitMapper.toEntity(model.training_circuit),
    );
  }

  @override
  Map<String, dynamic> toJson(ExerciseTrainingModel model) {
    return {
      'exercise_training_id': model.exercise_training_id.toJson(),
      'nb_reps': model.nb_reps,
      'intensity': model.intensity,
      'intensityType': model.intensityType,
      'exercise_data': exerciseDataMapper.toJson(model.exercise_data),
      'training_circuit': trainingCircuitMapper.toJson(model.training_circuit),
    };
  }
}
