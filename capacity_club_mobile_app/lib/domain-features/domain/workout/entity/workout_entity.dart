import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/entity/training_circuit_entity.dart';

class WorkoutEntity {
  final UniqueId workout_id;
  final String title;
  final List<TrainingCircuitEntity> training_circuits;
  final bool is_empty;

  WorkoutEntity(
      {required this.workout_id,
      required this.title,
      required this.training_circuits,
      required this.is_empty});

  factory WorkoutEntity.empty() {
    print('ENTER WORKOUT ENTITY EMPTY');
    return WorkoutEntity(
        workout_id: UniqueId(''),
        title: '',
        training_circuits: [],
        is_empty: true);
  }
}
