import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
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
      exercise_training_list: entity.exercise_training_list != []
          ? entity.exercise_training_list
              .map((trainingEntity) =>
                  exerciseTrainingMapper.fromEntity(trainingEntity))
              .toList()
          : [],
    );
  }

  @override
  ExerciseDataModel fromJson(Map<String, dynamic> json) {
    return ExerciseDataModel(
        exercise_data_id: json['exercise_data_id'] != null
            ? UniqueId.fromJson(json['exercise_data_id'])
            : UniqueId(''),
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        categories: json['categories'] ?? '',
        video_youtube_link: json['video_youtube_link'] ?? '',
        video_asset_link: json['video_asset_link'] ?? '',
        exercise_training_list: CommonHelperMethod.jsonContainsAndNotNullKey(
                json, 'exercise_training_list')
            ? (json['exercise_training_list'] as List? ?? [])
                .map((trainingJson) => exerciseTrainingMapper
                    .fromJson(trainingJson as Map<String, dynamic>))
                .toList()
            : []);
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
        exercise_training_list: model.exercise_training_list != []
            ? model.exercise_training_list
                .map((trainingModel) =>
                    exerciseTrainingMapper.toEntity(trainingModel))
                .toList()
            : [],
        is_empty: false);
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
      'exercise_training_list': model.exercise_training_list != []
          ? model.exercise_training_list
              .map((trainingModel) =>
                  exerciseTrainingMapper.toJson(trainingModel))
              .toList()
          : [],
    };
  }
}
