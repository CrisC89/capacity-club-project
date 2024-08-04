import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/indoor_training_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/mapper/indoor_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/mapper/member_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training-subscription/entity/indoor_training_subcription_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class IndoorTrainingSubscriptionMapper {
  static IndoorTrainingSubscriptionModel fromEntity(
      IndoorTrainingSubcriptionEntity entity) {
    return IndoorTrainingSubscriptionModel(
        indoor_training_subscription_id: entity.indoor_training_subscription_id,
        purchased_date: entity.purchased_date,
        member: entity.member.is_empty
            ? null
            : MemberMapper.fromEntity(entity.member),
        indoor_training: entity.indoor_training.is_empty
            ? null
            : IndoorTrainingMapper.fromEntity(entity.indoor_training));
  }

  static IndoorTrainingSubscriptionModel fromJson(Map<String, dynamic> json) {
    return IndoorTrainingSubscriptionModel(
        indoor_training_subscription_id:
            json['indoor_training_subscription_id'] != null
                ? UniqueId.fromJson(json['indoor_training_subscription_id'])
                : UniqueId(''),
        purchased_date: json['purchased_date'] != null
            ? DateTime.parse(json['purchased_date'])
            : DateTime.now(),
        member: CommonHelperMethod.jsonContainsAndNotNullKey(json, 'member')
            ? MemberMapper.fromJson(json['member'])
            : null,
        indoor_training: CommonHelperMethod.jsonContainsAndNotNullKey(
                json, 'indoor_training')
            ? IndoorTrainingMapper.fromJson(json['indoor_training'])
            : null);
  }

  static IndoorTrainingSubcriptionEntity toEntity(
      IndoorTrainingSubscriptionModel model) {
    print("enter indoor training subscription mapper to entity");
    IndoorTrainingSubcriptionEntity retval;
    try {
      retval = IndoorTrainingSubcriptionEntity(
          indoor_training_subscription_id:
              model.indoor_training_subscription_id,
          purchased_date: model.purchased_date,
          member: model.member != null
              ? MemberMapper.toEntity(model.member!)
              : MemberEntity.empty(),
          indoor_training: model.indoor_training != null
              ? IndoorTrainingMapper.toEntity(model.indoor_training!)
              : IndoorTrainingEntity.empty());
    } catch (e) {
      print(e.toString());
      retval = IndoorTrainingSubcriptionEntity.empty();
    }
    return retval;
  }

  static Map<String, dynamic> toJson(IndoorTrainingSubscriptionModel model) {
    return {
      'indoor_training_subscription_id':
          model.indoor_training_subscription_id.toJson(),
      'purchased_date': model.purchased_date.toIso8601String(),
      'member': model.member != null ? MemberMapper.toJson(model.member!) : {},
      'indoor_training': model.indoor_training != null
          ? IndoorTrainingMapper.toJson(model.indoor_training!)
          : {}
    };
  }
}
