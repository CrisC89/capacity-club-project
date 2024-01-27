import 'package:capacity_club_mobile_app/features/core/module/workout/domain/entity/workout.entity.dart';

class CollectiveTrainingSession {
  final String collective_training_session_id;
  final String title;
  final DateTime training_date;
  final String start_hours;
  final String end_hours;
  final int nb_place;
  final int nb_subscription;
  final Workout workout;

  const CollectiveTrainingSession(
      {required this.collective_training_session_id,
      required this.title,
      required this.training_date,
      required this.start_hours,
      required this.end_hours,
      required this.nb_place,
      required this.nb_subscription,
      required this.workout});

  factory CollectiveTrainingSession.empty() {
    return CollectiveTrainingSession(
        collective_training_session_id: '',
        title: '',
        training_date: DateTime.now(),
        start_hours: '',
        end_hours: '',
        nb_place: 0,
        nb_subscription: 0,
        workout: Workout.empty());
  }
}
