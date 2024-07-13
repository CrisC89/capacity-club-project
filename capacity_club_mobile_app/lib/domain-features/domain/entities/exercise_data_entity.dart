import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/entities/exercise_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/enum/exercise_data_category_enum.dart';

class ExerciseDataEntity {
  final UniqueId exercise_data_id;
  final String title;
  final List<String> description;
  final List<ExerciseDataCategory> categories;
  final String video_youtube_link;
  final String video_asset_link;
  final List<ExerciseTrainingEntity> exercise_training_list;

  ExerciseDataEntity(
      {required this.exercise_data_id,
      required this.title,
      required this.description,
      required this.categories,
      required this.video_youtube_link,
      required this.video_asset_link,
      required this.exercise_training_list});

  factory ExerciseDataEntity.empty() {
    return ExerciseDataEntity(
        exercise_data_id: UniqueId(''),
        title: '',
        description: [],
        categories: [],
        video_youtube_link: '',
        video_asset_link: '',
        exercise_training_list: []);
  }
}
