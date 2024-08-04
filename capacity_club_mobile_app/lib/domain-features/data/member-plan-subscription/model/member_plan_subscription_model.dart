import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/mapper/member_plan_subscription_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/member_plan_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:equatable/equatable.dart';

class MemberPlanSubscriptionModel extends Equatable {
  final UniqueId member_plan_subscription_id;
  final DateTime purchase_date;
  final MemberModel? member;
  final MemberPlanModel? member_plan;
  final MemberCardModel? member_card;

  MemberPlanSubscriptionModel(
      {required this.member_plan_subscription_id,
      required this.purchase_date,
      required this.member,
      required this.member_plan,
      required this.member_card});

  factory MemberPlanSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return MemberPlanSubscriptionMapper.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return MemberPlanSubscriptionMapper.toJson(this);
  }

  @override
  List<Object?> get props => [
        member_plan_subscription_id,
        purchase_date,
        member,
        member_plan,
        member_card
      ];
}
