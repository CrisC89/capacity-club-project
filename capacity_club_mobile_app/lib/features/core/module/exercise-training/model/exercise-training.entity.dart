import 'package:capacity_club_mobile_app/features/core/module/exercise-trainin-data/model/exercise-data.entity.dart';

class ExerciseTraining {
  final String exercise_training_id;
  final String title;
  final int nb_reps;
  final String intensity; // TrainingIntensity;
  final int member_feedback;
  final String member_note;
  final ExcerciseData exercise_data;

  ExerciseTraining(
      {required this.exercise_training_id,
      required this.title,
      required this.nb_reps,
      required this.intensity,
      required this.member_feedback,
      required this.member_note,
      required this.exercise_data});

  factory ExerciseTraining.empty() {
    return ExerciseTraining(
        exercise_training_id: '',
        title: '',
        nb_reps: 0,
        intensity: '',
        member_feedback: 0,
        member_note: '',
        exercise_data: ExcerciseData.empty());
  }
}
