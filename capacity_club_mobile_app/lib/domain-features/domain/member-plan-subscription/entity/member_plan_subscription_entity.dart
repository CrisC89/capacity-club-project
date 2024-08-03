import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-card/entity/member_card_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-plan/entity/member_plan_entity.dart';

class MemberPlanSubscriptionEntity {
  final UniqueId member_plan_subscription_id;
  final DateTime purchase_date;
  final MemberEntity member;
  final MemberPlanEntity member_plan;
  final MemberCardEntity member_card;
  final bool is_empty;
  MemberPlanSubscriptionEntity(
      {required this.member_plan_subscription_id,
      required this.purchase_date,
      required this.member,
      required this.member_plan,
      required this.member_card,
      this.is_empty = false});

  factory MemberPlanSubscriptionEntity.empty() {
    return MemberPlanSubscriptionEntity(
        member_plan_subscription_id: UniqueId(''),
        purchase_date: DateTime.now(),
        member: MemberEntity.empty(),
        member_plan: MemberPlanEntity.empty(),
        member_card: MemberCardEntity.empty(),
        is_empty: true);
  }
}
