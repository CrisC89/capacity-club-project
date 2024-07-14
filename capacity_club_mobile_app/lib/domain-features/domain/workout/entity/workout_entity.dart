import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/home-training/entity/home_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/entity/training_circuit_entity.dart';

class WorkoutEntity {
  final UniqueId workout_id;
  final String title;
  final List<TrainingCircuitEntity> training_circuits;
  final IndoorTrainingEntity indoor_training;
  final HomeTrainingEntity home_training;

  WorkoutEntity(
      {required this.workout_id,
      required this.title,
      required this.training_circuits,
      required this.indoor_training,
      required this.home_training});

  factory WorkoutEntity.empty() {
    return WorkoutEntity(
        workout_id: UniqueId(''),
        title: '',
        training_circuits: [],
        indoor_training: IndoorTrainingEntity.empty(),
        home_training: HomeTrainingEntity.empty());
  }
}
