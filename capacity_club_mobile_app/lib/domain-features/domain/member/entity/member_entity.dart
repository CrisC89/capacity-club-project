import 'package:capacity_club_mobile_app/auth/domain/entity/credential_entity.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/address/entity/address_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-card/entity/member_card_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-home-training/entity/member_home_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-plan-subscription/entity/member_plan_subscription_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/enum/gender_enum.dart';

class MemberEntity {
  final UniqueId member_id;
  final String firstname;
  final String lastname;
  final DateTime birthdate;
  final Gender gender;
  final String phone;
  final String mail;
  final String code_activation;
  final bool active;
  final List<MemberPlanSubscriptionEntity> subscriptions;
  final List<MemberHomeTrainingEntity> member_home_trainings;
  final AddressEntity address;
  final CredentialEntity credential;
  final MemberCardEntity member_card;

  MemberEntity(
      {required this.member_id,
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
      required this.member_card});

  factory MemberEntity.empty() {
    return MemberEntity(
        member_id: UniqueId(''),
        firstname: '',
        lastname: '',
        birthdate: DateTime.now(),
        gender: Gender.none,
        phone: '',
        mail: '',
        code_activation: '',
        active: false,
        subscriptions: [],
        member_home_trainings: [],
        address: AddressEntity.empty(),
        credential: CredentialEntity.empty(),
        member_card: MemberCardEntity.empty());
  }
}
