import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/indoor_training_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/mapper/indoor_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/mapper/member_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training-subscription/entity/indoor_training_subcription_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

import '../../../../../core/model/mixin/mapper_mixin.dart';

class IndoorTrainingSubscriptionMapper
    with
        Mapper<IndoorTrainingSubscriptionModel,
            IndoorTrainingSubcriptionEntity> {
  MemberMapper _memberMapper = MemberMapper();
  IndoorTrainingMapper _indoorTrainingMapper = IndoorTrainingMapper();
  @override
  IndoorTrainingSubscriptionModel fromEntity(
      IndoorTrainingSubcriptionEntity entity) {
    return IndoorTrainingSubscriptionModel(
        indoor_training_subscription_id: entity.indoor_training_subscription_id,
        purchased_date: entity.purchased_date,
        member: entity.member.is_empty
            ? null
            : _memberMapper.fromEntity(entity.member),
        indoor_training: entity.indoor_training.is_empty
            ? null
            : _indoorTrainingMapper.fromEntity(entity.indoor_training));
  }

  @override
  IndoorTrainingSubscriptionModel fromJson(Map<String, dynamic> json) {
    return IndoorTrainingSubscriptionModel(
        indoor_training_subscription_id:
            json['indoor_training_subscription_id'] != null
                ? UniqueId.fromJson(json['indoor_training_subscription_id'])
                : UniqueId(''),
        purchased_date: json['purchased_date'] != null
            ? DateTime.parse(json['purchased_date'])
            : DateTime.now(),
        member: CommonHelperMethod.jsonContainsAndNotNullKey(json, 'member')
            ? _memberMapper.fromJson(json['member'])
            : null,
        indoor_training: CommonHelperMethod.jsonContainsAndNotNullKey(
                json, 'indoor_training')
            ? _indoorTrainingMapper.fromJson(json['indoor_training'])
            : null);
  }

  @override
  IndoorTrainingSubcriptionEntity toEntity(
      IndoorTrainingSubscriptionModel model) {
    return IndoorTrainingSubcriptionEntity(
        indoor_training_subscription_id: model.indoor_training_subscription_id,
        purchased_date: model.purchased_date,
        member: model.member != null
            ? _memberMapper.toEntity(model.member!)
            : MemberEntity.empty(),
        indoor_training: model.indoor_training != null
            ? _indoorTrainingMapper.toEntity(model.indoor_training!)
            : IndoorTrainingEntity.empty());
  }

  @override
  Map<String, dynamic> toJson(IndoorTrainingSubscriptionModel model) {
    return {
      'indoor_training_subscription_id':
          model.indoor_training_subscription_id.toJson(),
      'purchased_date': model.purchased_date.toIso8601String(),
      'member': model.member != null ? _memberMapper.toJson(model.member!) : {},
      'indoor_training': model.indoor_training != null
          ? _indoorTrainingMapper.toJson(model.indoor_training!)
          : {}
    };
  }
}
