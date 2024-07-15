import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/enum/training_intensity.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/exercise_data_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';
import 'package:equatable/equatable.dart';

class ExerciseTrainingCreatePayload extends Equatable implements Payload {
  final int nb_reps;
  final String intensity;
  final TrainingIntensity intensityType;
  final ExerciseDataModel exercise_data;
  final TrainingCircuitModel training_circuit;

  const ExerciseTrainingCreatePayload({
    required this.nb_reps,
    required this.intensity,
    required this.intensityType,
    required this.exercise_data,
    required this.training_circuit,
  });

  Map<String, dynamic> toJson() => {
        'nb_reps': nb_reps,
        'intensity': intensity,
        'intensityType': intensityType.toString(), // Convert enum to String
        'exercise_data': exercise_data.toJson(), // Use model's toJson method
        'training_circuit':
            training_circuit.toJson(), // Use model's toJson method
      };

  @override
  List<Object?> get props => [
        nb_reps,
        intensity,
        intensityType,
        exercise_data,
        training_circuit,
      ];
}
