import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';

class MemberHomeTrainingFilter {
  final DateTime? purchase_date;
  final HomeTrainingModel? home_training;
  final MemberModel? member;

  const MemberHomeTrainingFilter({
    this.purchase_date,
    this.home_training,
    this.member,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json.addIfNotNull('purchase_date', purchase_date?.toIso8601String());
    json.addIfNotNull('home_training', home_training?.toJson());
    json.addIfNotNull('member', member?.toJson());

    return json;
  }
}
