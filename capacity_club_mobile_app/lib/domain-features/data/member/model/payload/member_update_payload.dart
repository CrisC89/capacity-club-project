import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/address_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/enum/gender_enum.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/member_home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/member_plan_subscription_model.dart';
import 'package:equatable/equatable.dart';

class MemberUpdatePayload extends Equatable implements Payload {
  final UniqueId member_id;
  final String firstname;
  final String lastname;
  final DateTime birthdate;
  final Gender gender;
  final String phone;
  final String mail;
  final String code_activation;
  final bool active;
  final List<MemberPlanSubscriptionModel> subscriptions;
  final List<MemberHomeTrainingModel> member_home_trainings;
  final AddressModel address;
  final CredentialModel credential;
  final MemberCardModel member_card;

  const MemberUpdatePayload({
    required this.member_id,
    required this.firstname,
    required this.lastname,
    required this.birthdate,
    required this.gender,
    required this.phone,
    required this.mail,
    required this.code_activation,
    required this.active,
    required this.subscriptions,
    required this.member_home_trainings,
    required this.address,
    required this.credential,
    required this.member_card,
  });

  Map<String, dynamic> toJson() => {
        'member_id': member_id.toJson(),
        'firstname': firstname,
        'lastname': lastname,
        'birthdate': birthdate.toIso8601String(),
        'gender': gender.toString(),
        'phone': phone,
        'mail': mail,
        'code_activation': code_activation,
        'active': active,
        'subscriptions': subscriptions.map((sub) => sub.toJson()).toList(),
        'member_home_trainings':
            member_home_trainings.map((training) => training.toJson()).toList(),
        'address': address.toJson(),
        'credential': credential.toJson(),
        'member_card': member_card.toJson(),
      };

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
        subscriptions,
        member_home_trainings,
        address,
        credential,
        member_card,
      ];
}
