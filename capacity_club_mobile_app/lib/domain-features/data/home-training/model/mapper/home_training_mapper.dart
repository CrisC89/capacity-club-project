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
    print("ENTER HOME TRAINING FROM JSON");
    print("Received JSON: $json");

    final homeTrainingId = json['home_training_id'];
    print("Type of home_training_id: ${homeTrainingId.runtimeType}");
    print("Value of home_training_id: $homeTrainingId");

    final title = json['title'];
    print("Type of title: ${title.runtimeType}");
    print("Value of title: $title");

    final nbWeek = json['nb_week'];
    print("Type of nb_week: ${nbWeek.runtimeType}");
    print("Value of nb_week: $nbWeek");

    final nbTrainingByWeek = json['nb_training_by_week'];
    print("Type of nb_training_by_week: ${nbTrainingByWeek.runtimeType}");
    print("Value of nb_training_by_week: $nbTrainingByWeek");

    final price = json['price'];
    print("Type of price: ${price.runtimeType}");
    print("Value of price: $price");

    final workouts = json['workouts'];
    print("Type of workouts: ${workouts.runtimeType}");
    print("Value of workouts: $workouts");

    return HomeTrainingModel(
      home_training_id: UniqueId(homeTrainingId ?? ''),
      title: title ?? '',
      nb_week: nbWeek ?? 0,
      nb_training_by_week: nbTrainingByWeek ?? 0,
      price: price ?? 0.0,
      workouts: (workouts as List? ?? [])
          .map((workoutJson) =>
              workoutMapper.fromJson(workoutJson as Map<String, dynamic>))
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
