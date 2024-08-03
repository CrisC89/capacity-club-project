import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/member_home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';

class IndoorTrainingSubscriptionFilter {
  final String? title;
  final String? description;
  final int? nb_week;
  final int? nb_training_by_week;
  final double? priceMin;
  final double? priceMax;
  final List<WorkoutModel>? workouts;
  final MemberHomeTrainingModel? member_home_trainings;

  IndoorTrainingSubscriptionFilter({
    this.title,
    this.description,
    this.nb_week,
    this.nb_training_by_week,
    this.priceMin,
    this.priceMax,
    this.workouts,
    this.member_home_trainings,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json.addIfNotNull('title', title);
    json.addIfNotNull('description', description);
    json.addIfNotNull('nb_week', nb_week);
    json.addIfNotNull('nb_training_by_week', nb_training_by_week);
    json.addIfNotNull('priceMin', priceMin);
    json.addIfNotNull('priceMax', priceMax);
    json.addIfNotNull('workouts', workouts?.map((e) => e.toJson()).toList());
    if (member_home_trainings != null) {
      json['member_home_trainings'] = member_home_trainings!.toJson();
    }
    return json;
  }
}
