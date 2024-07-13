import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/entities/member_card_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/entities/member_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/entities/member_plan_entity.dart';

class MemberPlanSubscriptionEntity {
  final UniqueId member_plan_subscription_id;
  final DateTime purchase_date;
  final MemberEntity member;
  final MemberPlanEntity member_plan;
  final MemberCardEntity member_card;
  MemberPlanSubscriptionEntity(
      {required this.member_plan_subscription_id,
      required this.purchase_date,
      required this.member,
      required this.member_plan,
      required this.member_card});

  factory MemberPlanSubscriptionEntity.empty() {
    return MemberPlanSubscriptionEntity(
        member_plan_subscription_id: UniqueId(''),
        purchase_date: DateTime.now(),
        member: MemberEntity.empty(),
        member_plan: MemberPlanEntity.empty(),
        member_card: MemberCardEntity.empty());
  }
}
