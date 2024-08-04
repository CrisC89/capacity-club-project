import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/mapper/home_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/mapper/indoor_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/mapper/training_circuit_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/entity/workout_entity.dart';

class WorkoutMapper {
  static WorkoutModel fromEntity(WorkoutEntity entity) {
    return WorkoutModel(
      workout_id: entity.workout_id,
      title: entity.title,
      training_circuits: entity.training_circuits != []
          ? entity.training_circuits
              .map((e) => TrainingCircuitMapper.fromEntity(e))
              .toList()
          : [],
      indoor_training: null,
      home_training: null,
    );
  }

  static WorkoutModel fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      workout_id: json['workout_id'] != null
          ? UniqueId.fromJson(json['workout_id'])
          : UniqueId(''),
      title: json['title'] ?? '',
      training_circuits: CommonHelperMethod.jsonContainsAndNotNullKey(
              json, 'training_circuits')
          ? (json['training_circuits'] as List)
              .map((e) => TrainingCircuitMapper.fromJson(e))
              .toList()
          : [],
      indoor_training:
          CommonHelperMethod.jsonContainsAndNotNullKey(json, 'indoor_training')
              ? IndoorTrainingMapper.fromJson(json['indoor_training'])
              : null,
      home_training:
          CommonHelperMethod.jsonContainsAndNotNullKey(json, 'home_training')
              ? HomeTrainingMapper.fromJson(json['home_training'])
              : null,
    );
  }

  static WorkoutEntity toEntity(WorkoutModel model) {
    print("enter workout mapper to entity");
    return WorkoutEntity(
        workout_id: model.workout_id,
        title: model.title,
        training_circuits: model.training_circuits != []
            ? model.training_circuits
                .map((e) => TrainingCircuitMapper.toEntity(e))
                .toList()
            : [],
        is_empty: false);
  }

  static Map<String, dynamic> toJson(WorkoutModel model) {
    return {
      'workout_id': model.workout_id,
      'title': model.title,
      'training_circuits': model.training_circuits != []
          ? model.training_circuits
              .map((e) => TrainingCircuitMapper.toJson(e))
              .toList()
          : [],
      'indoor_training': model.indoor_training != null
          ? IndoorTrainingMapper.toJson(model.indoor_training!)
          : {},
      'home_training': model.home_training != null
          ? HomeTrainingMapper.toJson(model.home_training!)
          : {},
    };
  }
}
