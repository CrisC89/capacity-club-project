import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/enum/exercise_data_category_enum.dart';

class ExerciseDataFilter {
  final String? title;
  final List<String>? description;
  final List<ExerciseDataCategory>? categories;
  final String? video_youtube_link;
  final String? video_asset_link;

  ExerciseDataFilter({
    this.title,
    this.description,
    this.categories,
    this.video_youtube_link,
    this.video_asset_link,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    json.addIfNotNull('title', title);
    json.addIfNotNull('description', description);
    json.addIfNotNull(
        'categories', categories?.map((e) => e.toJson()).toList());
    json.addIfNotNull('video_youtube_link', video_youtube_link);
    json.addIfNotNull('video_asset_link', video_asset_link);

    return json;
  }
}
