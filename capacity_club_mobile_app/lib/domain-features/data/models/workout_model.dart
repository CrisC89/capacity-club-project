import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:equatable/equatable.dart';

class WorkoutModel extends Equatable {
  final UniqueId workout_id;

  const WorkoutModel({
    required this.workout_id,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      workout_id: json['workout_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'workout_id': workout_id,
      };

  @override
  List<Object?> get props => [workout_id];
}
