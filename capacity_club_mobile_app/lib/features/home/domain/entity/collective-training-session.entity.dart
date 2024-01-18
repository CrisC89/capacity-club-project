class CollectiveTrainingSession {
  final String collective_training_session_id;
  final String title;
  final DateTime training_date;
  final DateTime start_hours;
  final DateTime end_hours;
  final int nb_place;
  //workout: Workout;

  const CollectiveTrainingSession(
      {required this.collective_training_session_id,
      required this.title,
      required this.training_date,
      required this.start_hours,
      required this.end_hours,
      required this.nb_place});

  factory CollectiveTrainingSession.empty() {
    return CollectiveTrainingSession(
        collective_training_session_id: '',
        title: '',
        training_date: DateTime.now(),
        start_hours: DateTime.now(),
        end_hours: DateTime.now(),
        nb_place: 0);
  }
}
