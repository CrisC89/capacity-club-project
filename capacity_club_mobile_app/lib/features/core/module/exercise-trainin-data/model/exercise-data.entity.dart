class ExcerciseData {
  final String exercise_data_id;
  final String title;
  final List<String> categories;
  final List<String> description;
  final String video_link;

  const ExcerciseData(
      {required this.exercise_data_id,
      required this.title,
      required this.categories,
      required this.description,
      required this.video_link});

  factory ExcerciseData.empty() {
    return const ExcerciseData(
        exercise_data_id: '',
        title: '',
        categories: [], //ExerciseDataCategory[];
        description: [],
        video_link: '');
  }
}
