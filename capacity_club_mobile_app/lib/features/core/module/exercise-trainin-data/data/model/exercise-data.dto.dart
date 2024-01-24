class ExcerciseDataDto {
  final String exercise_data_id;
  final String title;
  final List<String> categories;
  final List<String> description;
  final String video_link;

  const ExcerciseDataDto(
      {required this.exercise_data_id,
      required this.title,
      required this.categories,
      required this.description,
      required this.video_link});

  factory ExcerciseDataDto.fromJson(Map<String, dynamic> json) {
    return ExcerciseDataDto(
        exercise_data_id: json['exercise_data_id'],
        title: json['title'],
        categories: json['categories'],
        description: json['description'],
        video_link: json['video_link']);
  }

  Map<String, dynamic> toJson() => {
        'exercise_data_id': exercise_data_id,
        'title': title,
        'categories': categories,
        'description': description,
        'video_link': video_link
      };
}
