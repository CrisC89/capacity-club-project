import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-home-training/entity/member_home_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/entity/workout_entity.dart';

class HomeTrainingEntity {
  final UniqueId home_training_id;
  final String title;
  final String description;
  final int nb_week;
  final int nb_training_by_week;
  final double price;
  final List<WorkoutEntity> workouts;
  final MemberHomeTrainingEntity member_home_trainings;
  final bool is_empty;

  HomeTrainingEntity(
      {required this.home_training_id,
      required this.title,
      required this.description,
      required this.nb_week,
      required this.nb_training_by_week,
      required this.price,
      required this.workouts,
      required this.member_home_trainings,
      required this.is_empty});

  factory HomeTrainingEntity.empty() {
    return HomeTrainingEntity(
        home_training_id: UniqueId(''),
        title: '',
        description: '',
        nb_week: 0,
        nb_training_by_week: 0,
        price: 0,
        workouts: [],
        member_home_trainings: MemberHomeTrainingEntity.empty(),
        is_empty: true);
  }
}
