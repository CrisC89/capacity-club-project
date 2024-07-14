import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/address_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/member_home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/member_plan_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/enum/gender_enum.dart';

class MemberFilter {
  final String? firstname;
  final String? lastname;
  final DateTime? birthdate;
  final Gender? gender;
  final String? phone;
  final String? mail;
  final String? code_activation;
  final bool? active;
  final AddressModel? address;
  final CredentialModel? credential;
  final MemberCardModel? member_card;
  final List<MemberPlanSubscriptionModel>? subscriptions;
  final List<MemberHomeTrainingModel>? member_home_trainings;

  const MemberFilter({
    this.firstname,
    this.lastname,
    this.birthdate,
    this.gender,
    this.phone,
    this.mail,
    this.code_activation,
    this.active,
    this.address,
    this.credential,
    this.member_card,
    this.subscriptions,
    this.member_home_trainings,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json.addIfNotNull('firstname', firstname);
    json.addIfNotNull('lastname', lastname);
    json.addIfNotNull('birthdate', birthdate?.toIso8601String());
    json.addIfNotNull('gender', gender?.toJson());
    json.addIfNotNull('phone', phone);
    json.addIfNotNull('mail', mail);
    json.addIfNotNull('code_activation', code_activation);
    json.addIfNotNull('active', active);
    json.addIfNotNull('address', address?.toJson());
    json.addIfNotNull('credential', credential?.toJson());
    json.addIfNotNull('member_card', member_card?.toJson());
    json.addIfNotNull(
        'subscriptions', subscriptions?.map((e) => e.toJson()).toList());
    json.addIfNotNull('member_home_trainings',
        member_home_trainings?.map((e) => e.toJson()).toList());

    return json;
  }
}
