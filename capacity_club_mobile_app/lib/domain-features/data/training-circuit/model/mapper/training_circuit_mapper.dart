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
    print("ENTER TRAINING CIRCUIT FROM JSON");
    print("Received JSON: $json");

    final trainingCircuitId = json['training_circuit_id'];
    print("Type of training_circuit_id: ${trainingCircuitId.runtimeType}");
    print("Value of training_circuit_id: $trainingCircuitId");

    final title = json['title'];
    print("Type of title: ${title.runtimeType}");
    print("Value of title: $title");

    final exerciseTrainingList = json['exercise_training_list'];
    print(
        "Type of exercise_training_list: ${exerciseTrainingList.runtimeType}");
    print("Value of exercise_training_list: $exerciseTrainingList");

    final workout = json['workout'];
    print("Type of workout: ${workout.runtimeType}");
    print("Value of workout: $workout");

    return TrainingCircuitModel(
      training_circuit_id: trainingCircuitId ?? '',
      title: title ?? '',
      exercise_training_list: (exerciseTrainingList as List<dynamic>?)
              ?.map((e) =>
                  ExerciseTrainingMapper().fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      workout: WorkoutMapper().fromJson(workout ?? {}),
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
