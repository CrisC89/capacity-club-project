import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:equatable/equatable.dart';

class HomeTrainingUpdatePayload extends Equatable implements Payload {
  final UniqueId home_training_id;
  final String title;
  final int nb_week;
  final int nb_training_by_week;
  final double price;
  final List<WorkoutModel> workouts;

  const HomeTrainingUpdatePayload({
    required this.home_training_id,
    required this.title,
    required this.nb_week,
    required this.nb_training_by_week,
    required this.price,
    required this.workouts,
  });

  Map<String, dynamic> toJson() => {
        'home_training_id': home_training_id.toJson(),
        'title': title,
        'nb_week': nb_week,
        'nb_training_by_week': nb_training_by_week,
        'price': price,
        'workouts': workouts.map((workout) => workout.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        home_training_id,
        title,
        nb_week,
        nb_training_by_week,
        price,
        workouts,
      ];
}
