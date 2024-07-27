import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/exercise_data_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/mapper/exercise_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-data/entity/exercise_data_entity.dart';

class ExerciseDataMapper with Mapper<ExerciseDataModel, ExerciseDataEntity> {
  final ExerciseTrainingMapper exerciseTrainingMapper =
      ExerciseTrainingMapper();

  @override
  ExerciseDataModel fromEntity(ExerciseDataEntity entity) {
    return ExerciseDataModel(
      exercise_data_id: entity.exercise_data_id,
      title: entity.title,
      description: entity.description,
      categories: entity.categories,
      video_youtube_link: entity.video_youtube_link,
      video_asset_link: entity.video_asset_link,
      exercise_training_list: entity.exercise_training_list
          .map((trainingEntity) =>
              exerciseTrainingMapper.fromEntity(trainingEntity))
          .toList(),
    );
  }

  @override
  ExerciseDataModel fromJson(Map<String, dynamic> json) {
    print("ENTER EXERCISE DATA FROM JSON");
    print("Received JSON: $json");

    final exerciseDataId = json['exercise_data_id'];
    print("Type of exercise_data_id: ${exerciseDataId.runtimeType}");
    print("Value of exercise_data_id: $exerciseDataId");

    final title = json['title'];
    print("Type of title: ${title.runtimeType}");
    print("Value of title: $title");

    final description = json['description'];
    print("Type of description: ${description.runtimeType}");
    print("Value of description: $description");

    final categories = json['categories'];
    print("Type of categories: ${categories.runtimeType}");
    print("Value of categories: $categories");

    final videoYoutubeLink = json['video_youtube_link'];
    print("Type of video_youtube_link: ${videoYoutubeLink.runtimeType}");
    print("Value of video_youtube_link: $videoYoutubeLink");

    final videoAssetLink = json['video_asset_link'];
    print("Type of video_asset_link: ${videoAssetLink.runtimeType}");
    print("Value of video_asset_link: $videoAssetLink");

    final exerciseTrainingList = json['exercise_training_list'];
    print(
        "Type of exercise_training_list: ${exerciseTrainingList.runtimeType}");
    print("Value of exercise_training_list: $exerciseTrainingList");

    return ExerciseDataModel(
      exercise_data_id: UniqueId(exerciseDataId ?? ''),
      title: title ?? '',
      description: description ?? '',
      categories: categories ?? '',
      video_youtube_link: videoYoutubeLink ?? '',
      video_asset_link: videoAssetLink ?? '',
      exercise_training_list: (exerciseTrainingList as List? ?? [])
          .map((trainingJson) => exerciseTrainingMapper
              .fromJson(trainingJson as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  ExerciseDataEntity toEntity(ExerciseDataModel model) {
    return ExerciseDataEntity(
      exercise_data_id: model.exercise_data_id,
      title: model.title,
      description: model.description,
      categories: model.categories,
      video_youtube_link: model.video_youtube_link,
      video_asset_link: model.video_asset_link,
      exercise_training_list: model.exercise_training_list
          .map(
              (trainingModel) => exerciseTrainingMapper.toEntity(trainingModel))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson(ExerciseDataModel model) {
    return {
      'exercise_data_id': model.exercise_data_id.toJson(),
      'title': model.title,
      'description': model.description,
      'categories': model.categories,
      'video_youtube_link': model.video_youtube_link,
      'video_asset_link': model.video_asset_link,
      'exercise_training_list': model.exercise_training_list
          .map((trainingModel) => exerciseTrainingMapper.toJson(trainingModel))
          .toList(),
    };
  }
}
