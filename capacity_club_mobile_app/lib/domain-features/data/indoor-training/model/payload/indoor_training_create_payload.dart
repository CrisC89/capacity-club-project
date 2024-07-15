import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:equatable/equatable.dart';

class IndoorTrainingCreatePayload extends Equatable implements Payload {
  final String title;
  final DateTime training_date;
  final String start_hours;
  final String end_hours;
  final int nb_place;
  final int nb_subscription;
  final WorkoutModel? workout;

  const IndoorTrainingCreatePayload(
      {required this.title,
      required this.training_date,
      required this.start_hours,
      required this.end_hours,
      required this.nb_place,
      required this.nb_subscription,
      required this.workout});

  Map<String, dynamic> toJson() => {
        'title': title,
        'training_date': training_date,
        'start_hours': start_hours,
        'end_hours': end_hours,
        'nb_place': nb_place,
        'nb_subscription': nb_subscription,
        'workout': workout
      };

  @override
  List<Object?> get props =>
      [title, training_date, start_hours, end_hours, nb_place, nb_subscription];
}
