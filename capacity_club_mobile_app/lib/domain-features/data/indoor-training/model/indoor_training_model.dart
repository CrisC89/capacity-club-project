import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/mapper/indoor_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:equatable/equatable.dart';

class IndoorTrainingModel extends Equatable {
  final UniqueId indoor_training_id;
  final String title;
  final DateTime training_date;
  final String start_hours;
  final String end_hours;
  final int nb_place;
  final int nb_subscription;
  final bool is_collective;
  final WorkoutModel? workout;

  const IndoorTrainingModel(
      {required this.indoor_training_id,
      required this.title,
      required this.training_date,
      required this.start_hours,
      required this.end_hours,
      required this.nb_place,
      required this.nb_subscription,
      required this.is_collective,
      this.workout = null});

  factory IndoorTrainingModel.fromJson(Map<String, dynamic> json) {
    return IndoorTrainingMapper().fromJson(json);
  }

  Map<String, dynamic> toJson() => {
        'indoor_training_id': indoor_training_id,
        'title': title,
        'training_date': training_date,
        'start_hours': start_hours,
        'end_hours': end_hours,
        'nb_place': nb_place,
        'nb_subscription': nb_subscription,
        'is_collective': is_collective,
        'workout': workout
      };

  @override
  List<Object?> get props => [
        indoor_training_id,
        title,
        training_date,
        start_hours,
        end_hours,
        nb_place,
        nb_subscription,
        workout
      ];
}
