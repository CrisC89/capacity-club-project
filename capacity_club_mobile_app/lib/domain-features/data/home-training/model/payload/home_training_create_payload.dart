import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:equatable/equatable.dart';

class HomeTrainingCreatePayload extends Equatable implements Payload {
  final String title;
  final int nb_week;
  final int nb_training_by_week;
  final double price;
  final List<WorkoutModel> workouts;

  const HomeTrainingCreatePayload({
    required this.title,
    required this.nb_week,
    required this.nb_training_by_week,
    required this.price,
    required this.workouts,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'nb_week': nb_week,
        'nb_training_by_week': nb_training_by_week,
        'price': price,
        'workouts': workouts.map((workout) => workout.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        title,
        nb_week,
        nb_training_by_week,
        price,
        workouts,
      ];
}
