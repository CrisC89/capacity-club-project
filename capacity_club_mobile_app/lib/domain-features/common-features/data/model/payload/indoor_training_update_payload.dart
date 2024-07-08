import 'package:capacity_club_mobile_app/common/model/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/workout_model.dart';
import 'package:equatable/equatable.dart';

class IndoorTrainingUpdatePayload extends Equatable {
  final UniqueId indoor_training_id;
  final String title;
  final DateTime training_date;
  final String start_hours;
  final String end_hours;
  final int nb_place;
  final int nb_subscription;
  final WorkoutModel? workout;

  const IndoorTrainingUpdatePayload(
      {required this.indoor_training_id,
      required this.title,
      required this.training_date,
      required this.start_hours,
      required this.end_hours,
      required this.nb_place,
      required this.nb_subscription,
      required this.workout});

  factory IndoorTrainingUpdatePayload.fromJson(Map<String, dynamic> json) {
    return IndoorTrainingUpdatePayload(
      indoor_training_id: json['indoor_training_id'],
      title: json['title'],
      training_date: json['training_date'],
      start_hours: json['start_hours'],
      end_hours: json['end_hours'],
      nb_place: json['nb_place'],
      nb_subscription: json['nb_subscription'],
      workout: json['workout'],
    );
  }

  IndoorTrainingUpdatePayload copyWith({int? nb_subscription}) {
    return IndoorTrainingUpdatePayload(
        indoor_training_id: this.indoor_training_id,
        training_date: this.training_date,
        title: this.title,
        start_hours: this.start_hours,
        end_hours: this.end_hours,
        nb_place: this.nb_place,
        nb_subscription: nb_subscription ?? this.nb_subscription,
        workout: this.workout);
  }

  Map<String, dynamic> toJson() => {
        'indoor_training_id': indoor_training_id,
        'title': title,
        'training_date': training_date,
        'start_hours': start_hours,
        'end_hours': end_hours,
        'nb_place': nb_place,
        'nb_subscription': nb_subscription,
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
        nb_subscription
      ];
}
