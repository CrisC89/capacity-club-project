class IndoorTrainingFilter {
  final String? title;
  final DateTime? training_date;
  final String? start_hours;
  final String? end_hours;
  final int? nb_place;
  final int? nb_subscription;

  const IndoorTrainingFilter({
    this.title,
    this.training_date,
    this.start_hours,
    this.end_hours,
    this.nb_place,
    this.nb_subscription,
  });

  factory IndoorTrainingFilter.fromJson(Map<String, dynamic> json) {
    return IndoorTrainingFilter(
      title: json['title'],
      training_date: json[
          'training_date'], // training_date: json['training_date'] != null? DateTime.parse(json['training_date']): null,
      start_hours: json['start_hours'],
      end_hours: json['end_hours'],
      nb_place: json['nb_place'],
      nb_subscription: json['nb_subscription'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'training_date':
            training_date, //'training_date': training_date?.toIso8601String(),
        'start_hours': start_hours,
        'end_hours': end_hours,
        'nb_place': nb_place,
        'nb_subscription': nb_subscription,
      };
}
