import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training-subscription/entity/indoor_training_subcription_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/entity/workout_entity.dart';

class IndoorTrainingEntity {
  final UniqueId indoor_training_id;
  final String title;
  final DateTime training_date;
  final String start_hours;
  final String end_hours;
  final int nb_place;
  final int nb_subscription;
  final bool is_collective;
  final bool is_active;
  final WorkoutEntity workout;
  final List<IndoorTrainingSubcriptionEntity> indoor_training_subscription_list;
  final bool is_user_registred;
  final bool is_empty;

  IndoorTrainingEntity(
      {required this.indoor_training_id,
      required this.title,
      required this.training_date,
      required this.start_hours,
      required this.end_hours,
      required this.nb_place,
      required this.nb_subscription,
      required this.is_collective,
      required this.is_active,
      required this.workout,
      required this.indoor_training_subscription_list,
      this.is_user_registred = false,
      this.is_empty = false});

  factory IndoorTrainingEntity.empty() {
    return IndoorTrainingEntity(
        indoor_training_id: UniqueId(''),
        title: '',
        training_date: DateTime.now(),
        start_hours: '',
        end_hours: '',
        nb_place: 0,
        nb_subscription: 0,
        is_collective: false,
        is_active: false,
        is_user_registred: false,
        workout: WorkoutEntity.empty(),
        indoor_training_subscription_list: [],
        is_empty: true);
  }
}
