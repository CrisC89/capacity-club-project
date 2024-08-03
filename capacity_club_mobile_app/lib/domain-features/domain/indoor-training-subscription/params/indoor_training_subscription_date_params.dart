import 'package:capacity_club_mobile_app/core/model/abstract/params.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';

class IndoorTrainingSubscriptionDateParams extends Params {
  IndoorTrainingSubscriptionDateParams({
    required this.indoor_training,
  });

  final IndoorTrainingModel indoor_training;

  @override
  List<Object> get props => [indoor_training];
}
