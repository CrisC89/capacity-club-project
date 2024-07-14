import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/enum/training_intensity.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/exercise_data_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';
import 'package:equatable/equatable.dart';

class ExerciseTrainingUpdatePayload extends Equatable {
  final UniqueId exercise_training_id;
  final int nb_reps;
  final String intensity;
  final TrainingIntensity intensityType;
  final ExerciseDataModel exercise_data;
  final TrainingCircuitModel training_circuit;

  const ExerciseTrainingUpdatePayload({
    required this.exercise_training_id,
    required this.nb_reps,
    required this.intensity,
    required this.intensityType,
    required this.exercise_data,
    required this.training_circuit,
  });

  Map<String, dynamic> toJson() => {
        'exercise_training_id':
            exercise_training_id.toString(), // Convert UniqueId to String
        'nb_reps': nb_reps,
        'intensity': intensity,
        'intensityType': intensityType.toString(), // Convert enum to String
        'exercise_data': exercise_data.toJson(), // Use model's toJson method
        'training_circuit':
            training_circuit.toJson(), // Use model's toJson method
      };

  @override
  List<Object?> get props => [
        exercise_training_id,
        nb_reps,
        intensity,
        intensityType,
        exercise_data,
        training_circuit,
      ];
}
