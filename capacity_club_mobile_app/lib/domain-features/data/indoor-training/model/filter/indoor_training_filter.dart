import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';

class IndoorTrainingFilter {
  final String? title;
  final DateTime? training_date;
  final String? start_hours;
  final String? end_hours;
  final int? nb_place;
  final int? nb_subscription;
  final bool? is_collective;

  const IndoorTrainingFilter(
      {this.title,
      this.training_date,
      this.start_hours,
      this.end_hours,
      this.nb_place,
      this.nb_subscription,
      this.is_collective});

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json.addIfNotNull('title', title);
    json.addIfNotNull('training_date', training_date?.toIso8601String());
    json.addIfNotNull('start_hours', start_hours);
    json.addIfNotNull('end_hours', end_hours);
    json.addIfNotNull('nb_place', nb_place);
    json.addIfNotNull('is_collective', is_collective);
    json.addIfNotNull('nb_subscription', nb_subscription);
    return json;
  }
}
