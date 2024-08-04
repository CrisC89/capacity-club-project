import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/mapper/exercise_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/mapper/workout_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/entity/training_circuit_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/entity/workout_entity.dart';

class TrainingCircuitMapper {
  static TrainingCircuitModel fromEntity(TrainingCircuitEntity entity) {
    return TrainingCircuitModel(
      training_circuit_id: entity.training_circuit_id,
      title: entity.title,
      exercise_training_list: entity.exercise_training_list != []
          ? entity.exercise_training_list
              .map((e) => ExerciseTrainingMapper.fromEntity(e))
              .toList()
          : [],
      workout: entity.workout.is_empty
          ? null
          : WorkoutMapper.fromEntity(entity.workout),
    );
  }

  static TrainingCircuitModel fromJson(Map<String, dynamic> json) {
    return TrainingCircuitModel(
      training_circuit_id: json['training_circuit_id'] != null
          ? UniqueId.fromJson(json['training_circuit_id'])
          : UniqueId(''),
      title: json['title'] ?? '',
      exercise_training_list: CommonHelperMethod.jsonContainsAndNotNullKey(
              json, 'exercise_training_list')
          ? (json['exercise_training_list'] as List)
              .map((e) =>
                  ExerciseTrainingMapper.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      workout: CommonHelperMethod.jsonContainsAndNotNullKey(json, 'workout')
          ? WorkoutMapper.fromJson(json['workout'] ?? {})
          : null,
    );
  }

  static TrainingCircuitEntity toEntity(TrainingCircuitModel model) {
    return TrainingCircuitEntity(
        training_circuit_id: model.training_circuit_id,
        title: model.title,
        exercise_training_list: model.exercise_training_list != []
            ? model.exercise_training_list
                .map((e) => ExerciseTrainingMapper.toEntity(e))
                .toList()
            : [],
        workout: model.workout != null
            ? WorkoutMapper.toEntity(model.workout!)
            : WorkoutEntity.empty(),
        is_empty: false);
  }

  static Map<String, dynamic> toJson(TrainingCircuitModel model) {
    return {
      'training_circuit_id': model.training_circuit_id,
      'title': model.title,
      'exercise_training_list': model.exercise_training_list != []
          ? model.exercise_training_list
              .map((e) => ExerciseTrainingMapper.toJson(e))
              .toList()
          : [],
      'workout':
          model.workout != null ? WorkoutMapper.toJson(model.workout!) : {},
    };
  }
}
