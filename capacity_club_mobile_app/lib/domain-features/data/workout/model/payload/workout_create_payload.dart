import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';
import 'package:equatable/equatable.dart';

class WorkoutCreatePayload extends Equatable {
  final String title;
  final List<TrainingCircuitModel> training_circuits;
  final IndoorTrainingModel indoor_training;
  final HomeTrainingModel home_training;

  const WorkoutCreatePayload({
    required this.title,
    required this.training_circuits,
    required this.indoor_training,
    required this.home_training,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'training_circuits':
            training_circuits.map((item) => item.toJson()).toList(),
        'indoor_training': indoor_training.toJson(),
        'home_training': home_training.toJson(),
      };

  @override
  List<Object?> get props =>
      [title, training_circuits, indoor_training, home_training];
}
