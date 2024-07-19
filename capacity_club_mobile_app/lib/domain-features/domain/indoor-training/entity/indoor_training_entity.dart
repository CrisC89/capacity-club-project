import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/entity/workout_entity.dart';

class IndoorTrainingEntity {
  final UniqueId indoor_training_id;
  final String title;
  final DateTime training_date;
  final String start_hours;
  final String end_hours;
  final int nb_place;
  final int nb_subscription;
  final WorkoutEntity workout;

  IndoorTrainingEntity(
      {required this.indoor_training_id,
      required this.title,
      required this.training_date,
      required this.start_hours,
      required this.end_hours,
      required this.nb_place,
      required this.nb_subscription,
      required this.workout});

  factory IndoorTrainingEntity.empty() {
    return IndoorTrainingEntity(
        indoor_training_id: UniqueId(''),
        title: '',
        training_date: DateTime.now(),
        start_hours: '',
        end_hours: '',
        nb_place: 0,
        nb_subscription: 0,
        workout: WorkoutEntity.empty());
  }
}
