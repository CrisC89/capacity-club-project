import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';

class MemberPlanFilter {
  final String? title;
  final String? description;
  final int? nb_individual_training;
  final int? nb_collective_training;
  final double? price;

  const MemberPlanFilter({
    this.title,
    this.description,
    this.nb_individual_training,
    this.nb_collective_training,
    this.price,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json.addIfNotNull('title', title);
    json.addIfNotNull('description', description);
    json.addIfNotNull('nb_individual_training', nb_individual_training);
    json.addIfNotNull('nb_collective_training', nb_collective_training);
    json.addIfNotNull('price', price);

    return json;
  }
}
