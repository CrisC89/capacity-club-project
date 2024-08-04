import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/mapper/member_home_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/mapper/workout_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/home-training/entity/home_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-home-training/entity/member_home_training_entity.dart';

class HomeTrainingMapper {
  static HomeTrainingModel fromEntity(HomeTrainingEntity entity) {
    return HomeTrainingModel(
        home_training_id: entity.home_training_id,
        title: entity.title,
        description: entity.description,
        nb_week: entity.nb_week,
        nb_training_by_week: entity.nb_training_by_week,
        price: entity.price,
        workouts: entity.workouts != []
            ? entity.workouts
                .map((workoutEntity) => WorkoutMapper.fromEntity(workoutEntity))
                .toList()
            : [],
        member_home_trainings: entity.member_home_trainings.is_empty
            ? null
            : MemberHomeTrainingMapper.fromEntity(
                entity.member_home_trainings));
  }

  static HomeTrainingModel fromJson(Map<String, dynamic> json) {
    return HomeTrainingModel(
        home_training_id: json['home_training_id'] != null
            ? UniqueId.fromJson(json['home_training_id'])
            : UniqueId(''),
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        nb_week: json['nb_week'] ?? 0,
        nb_training_by_week: json['nb_training_by_week'] ?? 0,
        price: json['price'] ?? 0.0,
        workouts: CommonHelperMethod.jsonContainsAndNotNullKey(json, 'workouts')
            ? (json['workouts'] as List? ?? [])
                .map((workoutJson) =>
                    WorkoutMapper.fromJson(workoutJson as Map<String, dynamic>))
                .toList()
            : [],
        member_home_trainings: CommonHelperMethod.jsonContainsAndNotNullKey(
                json, 'member_home_trainings')
            ? MemberHomeTrainingMapper.fromJson(json['member_home_trainings'])
            : null);
  }

  static HomeTrainingEntity toEntity(HomeTrainingModel model) {
    return HomeTrainingEntity(
        home_training_id: model.home_training_id,
        title: model.title,
        description: model.description,
        nb_week: model.nb_week,
        nb_training_by_week: model.nb_training_by_week,
        price: model.price,
        workouts: model.workouts.isNotEmpty
            ? model.workouts
                .map((workoutModel) => WorkoutMapper.toEntity(workoutModel))
                .toList()
            : [],
        member_home_trainings: model.member_home_trainings != null
            ? MemberHomeTrainingMapper.toEntity(model.member_home_trainings!)
            : MemberHomeTrainingEntity.empty(),
        is_empty: false);
  }

  static Map<String, dynamic> toJson(HomeTrainingModel model) {
    return {
      'home_training_id': model.home_training_id,
      'title': model.title,
      'description': model.description,
      'nb_week': model.nb_week,
      'nb_training_by_week': model.nb_training_by_week,
      'price': model.price,
      'workouts': model.workouts != []
          ? model.workouts
              .map((workoutModel) => WorkoutMapper.toJson(workoutModel))
              .toList()
          : [],
      'member_home_trainings': model.member_home_trainings != null
          ? MemberHomeTrainingMapper.toJson(model.member_home_trainings!)
          : {}
    };
  }
}
