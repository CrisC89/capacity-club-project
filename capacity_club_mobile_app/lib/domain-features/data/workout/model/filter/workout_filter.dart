import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';

class WorkoutFilter {
  final String? title;
  final List<TrainingCircuitModel>? training_circuits;
  final IndoorTrainingModel? indoor_training;
  final HomeTrainingModel? home_training;

  const WorkoutFilter({
    this.title,
    this.training_circuits,
    this.indoor_training,
    this.home_training,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json.addIfNotNull('title', title);
    json.addIfNotNull(
      'training_circuits',
      training_circuits?.map((e) => e.toJson()).toList(),
    );
    json.addIfNotNull('indoor_training', indoor_training?.toJson());
    json.addIfNotNull('home_training', home_training?.toJson());

    return json;
  }
}
