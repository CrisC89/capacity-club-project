import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/mapper/member_card_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/member_plan_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/mapper/member_plan_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/mapper/member_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-card/entity/member_card_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-plan-subscription/entity/member_plan_subscription_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-plan/entity/member_plan_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class MemberPlanSubscriptionMapper {
  static MemberPlanSubscriptionModel fromEntity(
      MemberPlanSubscriptionEntity entity) {
    return MemberPlanSubscriptionModel(
      member_plan_subscription_id: entity.member_plan_subscription_id,
      purchase_date: entity.purchase_date,
      member: entity.member.is_empty
          ? null
          : MemberMapper.fromEntity(entity.member),
      member_plan: entity.member_plan.is_empty
          ? null
          : MemberPlanMapper.fromEntity(entity.member_plan),
      member_card: entity.member_card.is_empty
          ? null
          : MemberCardMapper.fromEntity(entity.member_card),
    );
  }

  static MemberPlanSubscriptionModel fromJson(Map<String, dynamic> json) {
    return MemberPlanSubscriptionModel(
      member_plan_subscription_id: json['member_plan_subscription_id']
          ? UniqueId.fromJson(json['member_plan_subscription_id'])
          : UniqueId(''),
      purchase_date: json['purchase_date'] != null
          ? DateTime.parse(json['purchase_date'])
          : DateTime.now(),
      member: CommonHelperMethod.jsonContainsAndNotNullKey(json, 'member')
          ? MemberMapper.fromJson(json['member'])
          : null,
      member_plan:
          CommonHelperMethod.jsonContainsAndNotNullKey(json, 'member_plan')
              ? MemberPlanMapper.fromJson(json['member_plan'])
              : null,
      member_card:
          CommonHelperMethod.jsonContainsAndNotNullKey(json, 'member_card')
              ? MemberCardMapper.fromJson(json['member_card'])
              : null,
    );
  }

  static MemberPlanSubscriptionEntity toEntity(
      MemberPlanSubscriptionModel model) {
    return MemberPlanSubscriptionEntity(
      member_plan_subscription_id: model.member_plan_subscription_id,
      purchase_date: model.purchase_date,
      member: model.member != null
          ? MemberMapper.toEntity(model.member!)
          : MemberEntity.empty(),
      member_plan: model.member_plan != null
          ? MemberPlanMapper.toEntity(model.member_plan!)
          : MemberPlanEntity.empty(),
      member_card: model.member_card != null
          ? MemberCardMapper.toEntity(model.member_card!)
          : MemberCardEntity.empty(),
    );
  }

  static Map<String, dynamic> toJson(MemberPlanSubscriptionModel model) {
    return {
      'member_plan_subscription_id': model.member_plan_subscription_id,
      'purchase_date': model.purchase_date.toIso8601String(),
      'member': model.member != null ? MemberMapper.toJson(model.member!) : {},
      'member_plan': model.member_plan != null
          ? MemberPlanMapper.toJson(model.member_plan!)
          : {},
      'member_card': model.member_card != null
          ? MemberCardMapper.toJson(model.member_card!)
          : {},
    };
  }
}
