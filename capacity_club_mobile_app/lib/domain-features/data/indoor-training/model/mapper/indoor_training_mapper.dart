import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/mapper/workout_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';

class IndoorTrainingMapper
    with Mapper<IndoorTrainingModel, IndoorTrainingEntity> {
  final WorkoutMapper workoutMapper = WorkoutMapper();

  @override
  IndoorTrainingModel fromEntity(IndoorTrainingEntity entity) {
    return IndoorTrainingModel(
      indoor_training_id: entity.indoor_training_id,
      title: entity.title,
      training_date: entity.training_date,
      start_hours: entity.start_hours,
      end_hours: entity.end_hours,
      nb_place: entity.nb_place,
      nb_subscription: entity.nb_subscription,
      is_collective: entity.is_collective,
      workout: workoutMapper.fromEntity(entity.workout),
    );
  }

  @override
  IndoorTrainingModel fromJson(Map<String, dynamic> json) {
    return IndoorTrainingModel(
      indoor_training_id: json['indoor_training_id'],
      title: json['title'],
      training_date: DateTime.parse(json['training_date']),
      start_hours: json['start_hours'],
      end_hours: json['end_hours'],
      nb_place: json['nb_place'],
      nb_subscription: json['nb_subscription'],
      is_collective: json['is_collective'],
      workout: WorkoutMapper().fromJson(json['workout']),
    );
  }

  @override
  IndoorTrainingEntity toEntity(IndoorTrainingModel model) {
    return IndoorTrainingEntity(
      indoor_training_id: model.indoor_training_id,
      title: model.title,
      training_date: model.training_date,
      start_hours: model.start_hours,
      end_hours: model.end_hours,
      nb_place: model.nb_place,
      nb_subscription: model.nb_subscription,
      is_collective: model.is_collective,
      workout: workoutMapper.toEntity(model.workout),
    );
  }

  @override
  Map<String, dynamic> toJson(IndoorTrainingModel model) {
    return {
      'indoor_training_id': model.indoor_training_id,
      'title': model.title,
      'training_date': model.training_date.toIso8601String(),
      'start_hours': model.start_hours,
      'end_hours': model.end_hours,
      'nb_place': model.nb_place,
      'nb_subscription': model.nb_subscription,
      'is_collective': model.is_collective,
      'workout': workoutMapper.toJson(model.workout),
    };
  }
}
