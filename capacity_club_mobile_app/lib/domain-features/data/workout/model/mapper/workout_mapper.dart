import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/mapper/home_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/mapper/indoor_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/mapper/training_circuit_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/entity/workout_entity.dart';

class WorkoutMapper with Mapper<WorkoutModel, WorkoutEntity> {
  @override
  WorkoutModel fromEntity(WorkoutEntity entity) {
    return WorkoutModel(
      workout_id: entity.workout_id,
      title: entity.title,
      training_circuits: entity.training_circuits
          .map((e) => TrainingCircuitMapper().fromEntity(e))
          .toList(),
      indoor_training:
          IndoorTrainingMapper().fromEntity(entity.indoor_training),
      home_training: HomeTrainingMapper().fromEntity(entity.home_training),
    );
  }

  @override
  WorkoutModel fromJson(Map<String, dynamic> json) {
    print("ENTER WORKOUT FROM JSON");
    print("Received JSON: $json");

    final workoutId = json['workout_id'];
    print("Type of workout_id: ${workoutId.runtimeType}");
    print("Value of workout_id: $workoutId");

    final title = json['title'];
    print("Type of title: ${title.runtimeType}");
    print("Value of title: $title");

    final trainingCircuits = json['training_circuits'];
    print("Type of training_circuits: ${trainingCircuits.runtimeType}");
    print("Value of training_circuits: $trainingCircuits");

    final indoorTraining = json['indoor_training'];
    print("Type of indoor_training: ${indoorTraining.runtimeType}");
    print("Value of indoor_training: $indoorTraining");

    final homeTraining = json['home_training'];
    print("Type of home_training: ${homeTraining.runtimeType}");
    print("Value of home_training: $homeTraining");

    return WorkoutModel(
      workout_id: workoutId ?? '',
      title: title ?? '',
      training_circuits: (trainingCircuits as List<dynamic>?)
              ?.map((e) =>
                  TrainingCircuitMapper().fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      indoor_training: IndoorTrainingMapper().fromJson(indoorTraining ?? {}),
      home_training: HomeTrainingMapper().fromJson(homeTraining ?? {}),
    );
  }

  @override
  WorkoutEntity toEntity(WorkoutModel model) {
    return WorkoutEntity(
      workout_id: model.workout_id,
      title: model.title,
      training_circuits: model.training_circuits
          .map((e) => TrainingCircuitMapper().toEntity(e))
          .toList(),
      indoor_training: IndoorTrainingMapper().toEntity(model.indoor_training),
      home_training: HomeTrainingMapper().toEntity(model.home_training),
    );
  }

  @override
  Map<String, dynamic> toJson(WorkoutModel model) {
    return {
      'workout_id': model.workout_id,
      'title': model.title,
      'training_circuits': model.training_circuits
          .map((e) => TrainingCircuitMapper().toJson(e))
          .toList(),
      'indoor_training': IndoorTrainingMapper().toJson(model.indoor_training),
      'home_training': HomeTrainingMapper().toJson(model.home_training),
    };
  }
}
