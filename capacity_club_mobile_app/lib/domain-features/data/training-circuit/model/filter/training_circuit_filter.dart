import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/exercise_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';

class TrainingCircuitFilter {
  final String? title;
  final List<ExerciseTrainingModel>? exercise_training_list;
  final WorkoutModel? workout;

  const TrainingCircuitFilter({
    this.title,
    this.exercise_training_list,
    this.workout,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json.addIfNotNull('title', title);
    json.addIfNotNull('exercise_training_list',
        exercise_training_list?.map((e) => e.toJson()).toList());
    json.addIfNotNull('workout', workout?.toJson());

    return json;
  }
}
