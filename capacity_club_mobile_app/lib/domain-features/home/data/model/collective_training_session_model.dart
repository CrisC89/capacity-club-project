import 'dart:ffi';

import 'package:capacity_club_mobile_app/common/model/unique_id.dart';
import 'package:equatable/equatable.dart';

class CollectiveTrainingSessionModel extends Equatable {
  final UniqueId collective_training_session_id;

  final String title;
  final DateTime training_date;
  final String start_hours;
  final String end_hours;
  final int nb_place;
  final int nb_subscription;
  //workout: Workout;

  const CollectiveTrainingSessionModel(
      {required this.collective_training_session_id,
      required this.title,
      required this.training_date,
      required this.start_hours,
      required this.end_hours,
      required this.nb_place,
      required this.nb_subscription});

  factory CollectiveTrainingSessionModel.fromJson(Map<String, dynamic> json) {
    return CollectiveTrainingSessionModel(
        collective_training_session_id: json['collective_training_session_id'],
        title: json['title'],
        training_date: json['training_date'],
        start_hours: json['start_hours'],
        end_hours: json['end_hours'],
        nb_place: json['nb_place'],
        nb_subscription: json['nb_subscription']);
  }

  Map<String, dynamic> toJson() => {
        'collective_training_session_id': collective_training_session_id,
        'title': title,
        'training_date': training_date,
        'start_hours': start_hours,
        'end_hours': end_hours,
        'nb_place': nb_place,
        'nb_subscription': nb_subscription
      };

  @override
  List<Object?> get props => [
        collective_training_session_id,
        title,
        training_date,
        start_hours,
        end_hours,
        nb_place,
        nb_subscription
      ];
}
