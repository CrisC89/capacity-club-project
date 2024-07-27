import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
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
      workout: workoutMapper.fromEntity(entity.workout!),
    );
  }

  @override
  IndoorTrainingModel fromJson(Map<String, dynamic> json) {
    print("ENTER INDOOR TRAINING FROM JSON");
    print("Received JSON: $json");

    final indoorTrainingId = json['indoor_training_id'];

    final title = json['title'];

    final trainingDate = json['training_date'];

    final startHours = json['start_hours'];

    final endHours = json['end_hours'];

    final nbPlace = json['nb_place'];

    final nbSubscription = json['nb_subscription'];

    final isCollective = json['is_collective'];

    final workout = json['workout'];

    final retval = IndoorTrainingModel(
        indoor_training_id: UniqueId.fromJson(indoorTrainingId),
        title: title ?? '',
        training_date: trainingDate != null
            ? DateTime.parse(trainingDate)
            : DateTime.now(),
        start_hours: startHours ?? '',
        end_hours: endHours ?? '',
        nb_place: nbPlace ?? 0,
        nb_subscription: nbSubscription ?? 0,
        is_collective: isCollective ?? false,
        workout: workout != null ? WorkoutMapper().fromJson(workout) : null);
    print("RETURN INDOOR TRAINING FROM JSON");
    return retval;
  }

  @override
  IndoorTrainingEntity toEntity(IndoorTrainingModel model) {
    print("ENTER TO ENTITY INDOOR TRAINING");
    print(model);
    final workout = model.workout;
    final retval = IndoorTrainingEntity(
      indoor_training_id: model.indoor_training_id,
      title: model.title,
      training_date: model.training_date,
      start_hours: model.start_hours,
      end_hours: model.end_hours,
      nb_place: model.nb_place,
      nb_subscription: model.nb_subscription,
      is_collective: model.is_collective,
      is_user_registred: false,
      workout: workout != null ? workoutMapper.toEntity(model.workout!) : null,
    );
    print("RETURN INDOOR TRAINING TO ENTITY");
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
      'workout': workoutMapper.toJson(model.workout!),
    };
  }
}
