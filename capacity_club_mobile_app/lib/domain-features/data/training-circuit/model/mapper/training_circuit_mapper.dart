import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/mapper/exercise_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/mapper/workout_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/entity/training_circuit_entity.dart';

class TrainingCircuitMapper
    with Mapper<TrainingCircuitModel, TrainingCircuitEntity> {
  @override
  TrainingCircuitModel fromEntity(TrainingCircuitEntity entity) {
    return TrainingCircuitModel(
      training_circuit_id: entity.training_circuit_id,
      title: entity.title,
      exercise_training_list: entity.exercise_training_list
          .map((e) => ExerciseTrainingMapper().fromEntity(e))
          .toList(),
      workout: WorkoutMapper().fromEntity(entity.workout),
    );
  }

  @override
  TrainingCircuitModel fromJson(Map<String, dynamic> json) {
    return TrainingCircuitModel(
      training_circuit_id: json['training_circuit_id'],
      title: json['title'],
      exercise_training_list: (json['exercise_training_list'] as List)
          .map((e) => ExerciseTrainingMapper().fromJson(e))
          .toList(),
      workout: WorkoutMapper().fromJson(json['workout']),
    );
  }

  @override
  TrainingCircuitEntity toEntity(TrainingCircuitModel model) {
    return TrainingCircuitEntity(
      training_circuit_id: model.training_circuit_id,
      title: model.title,
      exercise_training_list: model.exercise_training_list
          .map((e) => ExerciseTrainingMapper().toEntity(e))
          .toList(),
      workout: WorkoutMapper().toEntity(model.workout),
    );
  }

  @override
  Map<String, dynamic> toJson(TrainingCircuitModel model) {
    return {
      'training_circuit_id': model.training_circuit_id,
      'title': model.title,
      'exercise_training_list': model.exercise_training_list
          .map((e) => ExerciseTrainingMapper().toJson(e))
          .toList(),
      'workout': WorkoutMapper().toJson(model.workout),
    };
  }
}
