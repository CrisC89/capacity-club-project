import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/mapper/workout_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/home-training/entity/home_training_entity.dart';

class HomeTrainingMapper with Mapper<HomeTrainingModel, HomeTrainingEntity> {
  final WorkoutMapper workoutMapper = WorkoutMapper();

  @override
  HomeTrainingModel fromEntity(HomeTrainingEntity entity) {
    return HomeTrainingModel(
      home_training_id: entity.home_training_id,
      title: entity.title,
      nb_week: entity.nb_week,
      nb_training_by_week: entity.nb_training_by_week,
      price: entity.price,
      workouts: entity.workouts
          .map((workoutEntity) => workoutMapper.fromEntity(workoutEntity))
          .toList(),
    );
  }

  @override
  HomeTrainingModel fromJson(Map<String, dynamic> json) {
    return HomeTrainingModel(
      home_training_id: UniqueId(json['home_training_id']),
      title: json['title'],
      nb_week: json['nb_week'],
      nb_training_by_week: json['nb_training_by_week'],
      price: json['price'],
      workouts: (json['workouts'] as List)
          .map((workoutJson) => workoutMapper.fromJson(workoutJson))
          .toList(),
    );
  }

  @override
  HomeTrainingEntity toEntity(HomeTrainingModel model) {
    return HomeTrainingEntity(
      home_training_id: model.home_training_id,
      title: model.title,
      nb_week: model.nb_week,
      nb_training_by_week: model.nb_training_by_week,
      price: model.price,
      workouts: model.workouts
          .map((workoutModel) => workoutMapper.toEntity(workoutModel))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson(HomeTrainingModel model) {
    return {
      'home_training_id': model.home_training_id,
      'title': model.title,
      'nb_week': model.nb_week,
      'nb_training_by_week': model.nb_training_by_week,
      'price': model.price,
      'workouts': model.workouts
          .map((workoutModel) => workoutMapper.toJson(workoutModel))
          .toList(),
    };
  }
}
