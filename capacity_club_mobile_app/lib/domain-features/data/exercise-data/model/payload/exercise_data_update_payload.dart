import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/enum/exercise_data_category_enum.dart';
import 'package:equatable/equatable.dart';

class ExerciseDataUpdatePayload extends Equatable implements Payload {
  final UniqueId exercise_data_id;
  final String title;
  final List<String> description;
  final List<ExerciseDataCategory> categories;
  final String video_youtube_link;
  final String video_asset_link;

  const ExerciseDataUpdatePayload({
    required this.exercise_data_id,
    required this.title,
    required this.description,
    required this.categories,
    required this.video_youtube_link,
    required this.video_asset_link,
  });

  Map<String, dynamic> toJson() => {
        'exercise_data_id': exercise_data_id,
        'title': title,
        'description': description,
        'categories': categories,
        'video_youtube_link': video_youtube_link,
        'video_asset_link': video_asset_link,
      };

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
