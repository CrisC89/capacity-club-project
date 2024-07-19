import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/mapper/member_card_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/member_plan_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/mapper/member_plan_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/mapper/member_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-plan-subscription/entity/member_plan_subscription_entity.dart';

class MemberPlanSubscriptionMapper
    with Mapper<MemberPlanSubscriptionModel, MemberPlanSubscriptionEntity> {
  @override
  MemberPlanSubscriptionModel fromEntity(MemberPlanSubscriptionEntity entity) {
    return MemberPlanSubscriptionModel(
      member_plan_subscription_id: entity.member_plan_subscription_id,
      purchase_date: entity.purchase_date,
      member: MemberMapper().fromEntity(entity.member),
      member_plan: MemberPlanMapper().fromEntity(entity.member_plan),
      member_card: MemberCardMapper().fromEntity(entity.member_card),
    );
  }

  @override
  MemberPlanSubscriptionModel fromJson(Map<String, dynamic> json) {
    return MemberPlanSubscriptionModel(
      member_plan_subscription_id: json['member_plan_subscription_id'],
      purchase_date: DateTime.parse(json['purchase_date']),
      member: MemberMapper().fromJson(json['member']),
      member_plan: MemberPlanMapper().fromJson(json['member_plan']),
      member_card: MemberCardMapper().fromJson(json['member_card']),
    );
  }

  @override
  MemberPlanSubscriptionEntity toEntity(MemberPlanSubscriptionModel model) {
    return MemberPlanSubscriptionEntity(
      member_plan_subscription_id: model.member_plan_subscription_id,
      purchase_date: model.purchase_date,
      member: MemberMapper().toEntity(model.member),
      member_plan: MemberPlanMapper().toEntity(model.member_plan),
      member_card: MemberCardMapper().toEntity(model.member_card),
    );
  }

  @override
  Map<String, dynamic> toJson(MemberPlanSubscriptionModel model) {
    return {
      'member_plan_subscription_id': model.member_plan_subscription_id,
      'purchase_date': model.purchase_date.toIso8601String(),
      'member': MemberMapper().toJson(model.member),
      'member_plan': MemberPlanMapper().toJson(model.member_plan),
      'member_card': MemberCardMapper().toJson(model.member_card),
    };
  }
}
