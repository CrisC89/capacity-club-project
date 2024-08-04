import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/mapper/workout_mapper.dart';
import 'package:equatable/equatable.dart';

class WorkoutModel extends Equatable {
  final UniqueId workout_id;
  final String title;
  final List<TrainingCircuitModel> training_circuits;
  final IndoorTrainingModel? indoor_training;
  final HomeTrainingModel? home_training;

  const WorkoutModel(
      {required this.workout_id,
      required this.title,
      required this.home_training,
      required this.indoor_training,
      required this.training_circuits});

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutMapper.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return WorkoutMapper.toJson(this);
  }

  @override
  List<Object?> get props =>
      [workout_id, title, training_circuits, indoor_training, home_training];
}
