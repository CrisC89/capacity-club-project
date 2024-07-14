import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/member_plan_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:equatable/equatable.dart';

class MemberPlanSubscriptionModel extends Equatable {
  final UniqueId member_plan_subscription_id;
  final DateTime purchase_date;
  final MemberModel member;
  final MemberPlanModel member_plan;
  final MemberCardModel member_card;

  MemberPlanSubscriptionModel(
      {required this.member_plan_subscription_id,
      required this.purchase_date,
      required this.member,
      required this.member_plan,
      required this.member_card});

  factory MemberPlanSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return MemberPlanSubscriptionModel(
        member_plan_subscription_id: json['member_plan_subscription_id'],
        purchase_date: json['purchase_date'],
        member: json['member'],
        member_plan: json['member_plan'],
        member_card: json['member_card']);
  }

  Map<String, dynamic> toJson() => {
        'member_plan_subscription_id': member_plan_subscription_id,
        'purchase_date': purchase_date,
        'member': member,
        'member_plan': member_plan,
        'member_card': member_card,
      };

  @override
  List<Object?> get props => [
        member_plan_subscription_id,
        purchase_date,
        member,
        member_plan,
        member_card
      ];
}
