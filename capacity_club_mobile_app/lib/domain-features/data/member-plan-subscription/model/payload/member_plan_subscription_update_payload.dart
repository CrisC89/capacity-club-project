import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/member_plan_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:equatable/equatable.dart';

class MemberPlanSubscriptionUpdatePayload extends Equatable {
  final UniqueId member_plan_subscription_id;
  final DateTime purchase_date;
  final MemberModel member;
  final MemberPlanModel member_plan;
  final MemberCardModel member_card;

  const MemberPlanSubscriptionUpdatePayload({
    required this.member_plan_subscription_id,
    required this.purchase_date,
    required this.member,
    required this.member_plan,
    required this.member_card,
  });

  Map<String, dynamic> toJson() => {
        'member_plan_subscription_id': member_plan_subscription_id.toJson(),
        'purchase_date': purchase_date.toIso8601String(),
        'member': member.toJson(),
        'member_plan': member_plan.toJson(),
        'member_card': member_card.toJson(),
      };

  @override
  List<Object?> get props => [
        member_plan_subscription_id,
        purchase_date,
        member,
        member_plan,
        member_card,
      ];
}
