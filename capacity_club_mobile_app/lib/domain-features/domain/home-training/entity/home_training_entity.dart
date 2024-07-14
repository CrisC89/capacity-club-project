import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/entity/workout_entity.dart';

class HomeTrainingEntity {
  final UniqueId home_training_id;
  final String title;
  final int nb_week;
  final int nb_training_by_week;
  final double price;
  final List<WorkoutEntity> workouts;

  HomeTrainingEntity(
      {required this.home_training_id,
      required this.title,
      required this.nb_week,
      required this.nb_training_by_week,
      required this.price,
      required this.workouts});

  factory HomeTrainingEntity.empty() {
    return HomeTrainingEntity(
        home_training_id: UniqueId(''),
        title: '',
        nb_week: 0,
        nb_training_by_week: 0,
        price: 0,
        workouts: []);
  }
}
