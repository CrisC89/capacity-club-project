import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/member_plan_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';

class MemberPlanSubscriptionFilter {
  final DateTime? purchase_date;
  final MemberModel? member;
  final MemberPlanModel? member_plan;
  final MemberCardModel? member_card;

  const MemberPlanSubscriptionFilter({
    this.purchase_date,
    this.member,
    this.member_plan,
    this.member_card,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json.addIfNotNull('purchase_date', purchase_date?.toIso8601String());
    json.addIfNotNull('member', member?.toJson());
    json.addIfNotNull('member_plan', member_plan?.toJson());
    json.addIfNotNull('member_card', member_card?.toJson());

    return json;
  }
}
