import 'package:capacity_club_mobile_app/features/core/module/exercise-trainin-data/domain/entity/exercise-data.entity.dart';

class ExerciseTrainingDto {
  final String exercise_training_id;
  final String title;
  final int nb_reps;
  final String intensity; // TrainingIntensity;
  final int member_feedback;
  final String member_note;
  final ExcerciseData exercise_data;

  ExerciseTrainingDto(
      {required this.exercise_training_id,
      required this.title,
      required this.nb_reps,
      required this.intensity,
      required this.member_feedback,
      required this.member_note,
      required this.exercise_data});

  factory ExerciseTrainingDto.fromJson(Map<String, dynamic> json) {
    return ExerciseTrainingDto(
        exercise_training_id: json['exercise_training_id'],
        title: json['title'],
        nb_reps: json['nb_reps'],
        intensity: json['intensity'],
        member_feedback: json['member_feedback'],
        member_note: json['member_note'],
        exercise_data: json['exercise_data']);
  }

  Map<String, dynamic> toJson() => {
        'exercise_training_id': exercise_training_id,
        'title': title,
        'nb_reps': nb_reps,
        'intensity': intensity,
        'member_feedback': member_feedback,
        'member_note': member_note,
        'exercise_data': exercise_data
      };
}
