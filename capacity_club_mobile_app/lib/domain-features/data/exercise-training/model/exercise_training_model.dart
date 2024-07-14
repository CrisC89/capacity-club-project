import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/exercise_data_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/enum/training_intensity.dart';
import 'package:equatable/equatable.dart';

class ExerciseTrainingModel extends Equatable {
  final UniqueId exercise_training_id;
  final int nb_reps;
  final String intensity;
  final TrainingIntensity intensityType;
  final ExerciseDataModel exercise_data;
  final TrainingCircuitModel training_circuit;

  const ExerciseTrainingModel({
    required this.exercise_training_id,
    required this.nb_reps,
    required this.intensity,
    required this.intensityType,
    required this.exercise_data,
    required this.training_circuit,
  });

  factory ExerciseTrainingModel.fromJson(Map<String, dynamic> json) {
    return ExerciseTrainingModel(
      exercise_training_id: json['exercise_training_id'],
      nb_reps: json['nb_reps'],
      intensity: json['intensity'],
      intensityType: json['intensityType'],
      exercise_data: json['exercise_data'],
      training_circuit: json['training_circuit'],
    );
  }

  Map<String, dynamic> toJson() => {
        'exercise_training_id': exercise_training_id,
        'nb_reps': nb_reps,
        'intensity': intensity,
        'intensityType': intensityType,
        'exercise_data': exercise_data,
        'training_circuit': training_circuit,
      };

  @override
  List<Object?> get props => [
        exercise_training_id,
        nb_reps,
        intensity,
        intensityType,
        exercise_data,
        training_circuit
      ];
}
