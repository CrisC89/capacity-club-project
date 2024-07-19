import 'package:capacity_club_mobile_app/auth/data/model/mapper/credential_mapper.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/mapper/address_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/mapper/member_card_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/mapper/member_home_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/mapper/member_plan_subscription_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/enum/gender_enum.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class MemberMapper with Mapper<MemberModel, MemberEntity> {
  final MemberPlanSubscriptionMapper subscriptionMapper =
      MemberPlanSubscriptionMapper();
  final MemberHomeTrainingMapper homeTrainingMapper =
      MemberHomeTrainingMapper();
  final AddressMapper addressMapper = AddressMapper();
  final CredentialMapper credentialMapper = CredentialMapper();
  final MemberCardMapper memberCardMapper = MemberCardMapper();

  @override
  MemberModel fromEntity(MemberEntity entity) {
    return MemberModel(
      member_id: entity.member_id,
      firstname: entity.firstname,
      lastname: entity.lastname,
      birthdate: entity.birthdate,
      gender: entity.gender,
      phone: entity.phone,
      mail: entity.mail,
      code_activation: entity.code_activation,
      active: entity.active,
      subscriptions: entity.subscriptions
          .map((e) => subscriptionMapper.fromEntity(e))
          .toList(),
      member_home_trainings: entity.member_home_trainings
          .map((e) => homeTrainingMapper.fromEntity(e))
          .toList(),
      address: addressMapper.fromEntity(entity.address),
      credential: credentialMapper.fromEntity(entity.credential),
      member_card: memberCardMapper.fromEntity(entity.member_card),
    );
  }

  @override
  MemberModel fromJson(Map<String, dynamic> json) {
    return MemberModel(
      member_id: json['member_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      birthdate: DateTime.parse(json['birthdate']),
      gender: Gender.values[json['gender']],
      phone: json['phone'],
      mail: json['mail'],
      code_activation: json['code_activation'],
      active: json['active'],
      subscriptions: (json['subscriptions'] as List)
          .map((e) => subscriptionMapper.fromJson(e))
          .toList(),
      member_home_trainings: (json['member_home_trainings'] as List)
          .map((e) => homeTrainingMapper.fromJson(e))
          .toList(),
      address: addressMapper.fromJson(json['address']),
      credential: credentialMapper.fromJson(json['credential']),
      member_card: memberCardMapper.fromJson(json['member_card']),
    );
  }

  @override
  MemberEntity toEntity(MemberModel model) {
    return MemberEntity(
      member_id: model.member_id,
      firstname: model.firstname,
      lastname: model.lastname,
      birthdate: model.birthdate,
      gender: model.gender,
      phone: model.phone,
      mail: model.mail,
      code_activation: model.code_activation,
      active: model.active,
      subscriptions: model.subscriptions
          .map((e) => subscriptionMapper.toEntity(e))
          .toList(),
      member_home_trainings: model.member_home_trainings
          .map((e) => homeTrainingMapper.toEntity(e))
          .toList(),
      address: addressMapper.toEntity(model.address),
      credential: credentialMapper.toEntity(model.credential),
      member_card: memberCardMapper.toEntity(model.member_card),
    );
  }

  @override
  Map<String, dynamic> toJson(MemberModel model) {
    return {
      'member_id': model.member_id,
      'firstname': model.firstname,
      'lastname': model.lastname,
      'birthdate': model.birthdate.toIso8601String(),
      'gender': model.gender.index,
      'phone': model.phone,
      'mail': model.mail,
      'code_activation': model.code_activation,
      'active': model.active,
      'subscriptions':
          model.subscriptions.map((e) => subscriptionMapper.toJson(e)).toList(),
      'member_home_trainings': model.member_home_trainings
          .map((e) => homeTrainingMapper.toJson(e))
          .toList(),
      'address': addressMapper.toJson(model.address),
      'credential': credentialMapper.toJson(model.credential),
      'member_card': memberCardMapper.toJson(model.member_card),
    };
  }
}
