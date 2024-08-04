import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/enum/exercise_data_category_enum.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/mapper/exercise_data_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/exercise_training_model.dart';
import 'package:equatable/equatable.dart';

class ExerciseDataModel extends Equatable {
  final UniqueId exercise_data_id;
  final String title;
  final List<String> description;
  final List<ExerciseDataCategory> categories;
  final String video_youtube_link;
  final String video_asset_link;
  final List<ExerciseTrainingModel> exercise_training_list;

  const ExerciseDataModel(
      {required this.exercise_data_id,
      required this.title,
      required this.description,
      required this.categories,
      required this.video_youtube_link,
      required this.video_asset_link,
      required this.exercise_training_list});

  factory ExerciseDataModel.fromJson(Map<String, dynamic> json) {
    return ExerciseDataMapper.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return ExerciseDataMapper.toJson(this);
  }

  @override
  List<Object?> get props => [
        exercise_data_id,
        title,
        description,
        categories,
        video_youtube_link,
        video_asset_link,
      ];
}
