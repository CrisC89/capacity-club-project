import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/mapper/home_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/member_home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:equatable/equatable.dart';

class HomeTrainingModel extends Equatable {
  final UniqueId home_training_id;
  final String title;
  final String description;
  final int nb_week;
  final int nb_training_by_week;
  final double price;
  final List<WorkoutModel> workouts;
  final MemberHomeTrainingModel? member_home_trainings;

  HomeTrainingModel(
      {required this.home_training_id,
      required this.title,
      required this.description,
      required this.nb_week,
      required this.nb_training_by_week,
      required this.price,
      required this.workouts,
      required this.member_home_trainings});

  factory HomeTrainingModel.fromJson(Map<String, dynamic> json) {
    return HomeTrainingMapper.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return HomeTrainingMapper.toJson(this);
  }

  @override
  List<Object?> get props =>
      [home_training_id, title, nb_week, nb_training_by_week, price, workouts];
}
