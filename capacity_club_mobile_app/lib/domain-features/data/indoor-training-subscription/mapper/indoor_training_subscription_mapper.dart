import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/indoor_training_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training-subscription/entity/indoor_training_subcription_entity.dart';

import '../../../../core/model/mixin/mapper_mixin.dart';

class IndoorTrainingSubscriptionMapper
    with
        Mapper<IndoorTrainingSubscriptionModel,
            IndoorTrainingSubcriptionEntity> {
  @override
  IndoorTrainingSubscriptionModel fromEntity(
      IndoorTrainingSubcriptionEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  IndoorTrainingSubscriptionModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  IndoorTrainingSubcriptionEntity toEntity(
      IndoorTrainingSubscriptionModel model) {
    // TODO: implement toEntity
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(IndoorTrainingSubscriptionModel model) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
