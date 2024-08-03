import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/mapper/indoor_training_subscription_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/mapper/workout_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/entity/workout_entity.dart';

class IndoorTrainingMapper
    with Mapper<IndoorTrainingModel, IndoorTrainingEntity> {
  final WorkoutMapper _workoutMapper = WorkoutMapper();
  final IndoorTrainingSubscriptionMapper _indoorTrainingSubscriptionMapper =
      IndoorTrainingSubscriptionMapper();
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
        is_active: entity.is_active,
        workout: entity.workout.is_empty
            ? null
            : _workoutMapper.fromEntity(entity.workout),
        indoor_training_subscription_list:
            entity.indoor_training_subscription_list != []
                ? entity.indoor_training_subscription_list
                    .map((indoorTraining) => _indoorTrainingSubscriptionMapper
                        .fromEntity(indoorTraining))
                    .toList()
                : []);
  }

  @override
  IndoorTrainingModel fromJson(Map<String, dynamic> json) {
    final workout = json['workout'];
    final retval = IndoorTrainingModel(
        indoor_training_id: json['indoor_training_id'] != null
            ? UniqueId.fromJson(json['indoor_training_id'])
            : UniqueId(''),
        title: json['title'] ?? '',
        training_date: json['training_date'] != null
            ? DateTime.parse(json['training_date'])
            : DateTime.now(),
        start_hours: json['start_hours'] ?? '',
        end_hours: json['end_hours'] ?? '',
        nb_place: json['nb_place'] ?? 0,
        nb_subscription: json['nb_subscription'] ?? 0,
        is_collective: json['is_collective'] ?? false,
        is_active: json['is_active'],
        workout: workout != null ? _workoutMapper.fromJson(workout) : null,
        indoor_training_subscription_list:
            CommonHelperMethod.jsonContainsAndNotNullKey(
                    json, 'indoor_training_subscription_list')
                ? (json['indoor_training_subscription_list'] as List? ?? [])
                    .map((indoorTraining) => _indoorTrainingSubscriptionMapper
                        .fromJson(indoorTraining))
                    .toList()
                : []);

    return retval;
  }

  @override
  IndoorTrainingEntity toEntity(IndoorTrainingModel model) {
    final retval = IndoorTrainingEntity(
        indoor_training_id: model.indoor_training_id,
        title: model.title,
        training_date: model.training_date,
        start_hours: model.start_hours,
        end_hours: model.end_hours,
        nb_place: model.nb_place,
        nb_subscription: model.nb_subscription,
        is_collective: model.is_collective,
        is_active: model.is_active,
        is_user_registred: false,
        workout: model.workout != null
            ? _workoutMapper.toEntity(model.workout!)
            : WorkoutEntity.empty(),
        indoor_training_subscription_list:
            model.indoor_training_subscription_list != []
                ? model.indoor_training_subscription_list
                    .map((indoorTraining) => _indoorTrainingSubscriptionMapper
                        .toEntity(indoorTraining))
                    .toList()
                : [],
        is_empty: false);
    return retval;
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
      'is_active': model.is_active,
      'workout':
          model.workout != null ? _workoutMapper.toJson(model.workout!) : {},
      'indoor_training_subscription_list':
          model.indoor_training_subscription_list != []
              ? model.indoor_training_subscription_list
                  .map((indoorTraining) =>
                      _indoorTrainingSubscriptionMapper.toJson(indoorTraining))
                  .toList()
              : [],
    };
  }
}
