import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/address_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/indoor_training_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/member_home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/member_plan_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/enum/gender_enum.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/mapper/member_mapper.dart';
import 'package:equatable/equatable.dart';

class MemberModel extends Equatable {
  final UniqueId member_id;
  final String firstname;
  final String lastname;
  final DateTime birthdate;
  final Gender gender;
  final String phone;
  final String mail;
  final String code_activation;
  final bool active;
  final List<MemberPlanSubscriptionModel> member_plan_subscriptions;
  final List<MemberHomeTrainingModel> member_home_trainings;
  final List<IndoorTrainingSubscriptionModel> indoor_training_subscription;
  final AddressModel? address;
  final CredentialModel? credential;
  final MemberCardModel? member_card;

  MemberModel(
      {required this.member_id,
      required this.firstname,
      required this.lastname,
      required this.birthdate,
      required this.gender,
      required this.phone,
      required this.mail,
      required this.code_activation,
      required this.active,
      required this.member_plan_subscriptions,
      required this.indoor_training_subscription,
      required this.member_home_trainings,
      required this.address,
      required this.credential,
      required this.member_card});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberMapper.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return MemberMapper.toJson(this);
  }

  @override
  List<Object?> get props => [
        member_id,
        firstname,
        lastname,
        birthdate,
        gender,
        phone,
        mail,
        code_activation,
        active,
        member_plan_subscriptions,
        indoor_training_subscription,
        member_home_trainings,
        address,
        credential,
        member_card
      ];
}
