class CollectiveTrainingSessionDto {
  final String collective_training_session_id;
  final String title;
  final DateTime training_date;
  final DateTime start_hours;
  final DateTime end_hours;
  final int nb_place;
  final String fk_workout_id;

  const CollectiveTrainingSessionDto(
      {required this.collective_training_session_id,
      required this.title,
      required this.training_date,
      required this.start_hours,
      required this.end_hours,
      required this.nb_place,
      required this.fk_workout_id});

  factory CollectiveTrainingSessionDto.fromJson(Map<String, dynamic> json) {
    return CollectiveTrainingSessionDto(
        collective_training_session_id: json['collective_training_session_id'],
        title: json['title'],
        training_date: json['training_date'],
        start_hours: json['start_hours'],
        end_hours: json['end_hours'],
        nb_place: json['nb_place'],
        fk_workout_id: json['fk_workout_id']);
  }

  Map<String, dynamic> toJson() => {
        'collective_training_session_id': collective_training_session_id,
        'title': title,
        'training_date': training_date,
        'start_hours': start_hours,
        'end_hours': end_hours,
        'nb_place': nb_place,
        'fk_workout_id': fk_workout_id
      };
}
