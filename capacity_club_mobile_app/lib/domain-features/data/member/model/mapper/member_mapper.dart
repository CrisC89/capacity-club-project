import 'package:capacity_club_mobile_app/auth/data/model/mapper/credential_mapper.dart';
import 'package:capacity_club_mobile_app/auth/domain/entity/credential_entity.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/helper/common_helper.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/mapper/address_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/mapper/indoor_training_subscription_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/mapper/member_card_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/mapper/member_home_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/mapper/member_plan_subscription_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/enum/gender_enum.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/address/entity/address_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-card/entity/member_card_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class MemberMapper with Mapper<MemberModel, MemberEntity> {
  final MemberPlanSubscriptionMapper _memberPlanSubscriptionMapper =
      MemberPlanSubscriptionMapper();
  final MemberHomeTrainingMapper _homeTrainingMapper =
      MemberHomeTrainingMapper();
  final IndoorTrainingSubscriptionMapper _indoorTrainingSubscriptionMapper =
      IndoorTrainingSubscriptionMapper();
  final AddressMapper _addressMapper = AddressMapper();
  final CredentialMapper _credentialMapper = CredentialMapper();
  final MemberCardMapper _memberCardMapper = MemberCardMapper();

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
      member_plan_subscriptions: entity.member_plan_subscriptions != []
          ? entity.member_plan_subscriptions
              .map((e) => _memberPlanSubscriptionMapper.fromEntity(e))
              .toList()
          : [],
      member_home_trainings: entity.member_home_trainings != []
          ? entity.member_home_trainings
              .map((e) => _homeTrainingMapper.fromEntity(e))
              .toList()
          : [],
      indoor_training_subscription: entity.indoor_training_subscription != []
          ? entity.indoor_training_subscription
              .map((e) => _indoorTrainingSubscriptionMapper.fromEntity(e))
              .toList()
          : [],
      address: entity.address.is_empty
          ? null
          : _addressMapper.fromEntity(entity.address),
      credential: entity.credential.is_empty
          ? null
          : _credentialMapper.fromEntity(entity.credential),
      member_card: entity.member_card.is_empty
          ? null
          : _memberCardMapper.fromEntity(entity.member_card),
    );
  }

  @override
  MemberModel fromJson(Map<String, dynamic> json) {
    return MemberModel(
      member_id: json['member_id'] != null
          ? UniqueId.fromJson(json['member_id'])
          : UniqueId(''),
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      birthdate: json['birthdate'] != null
          ? DateTime.parse(json['birthdate'])
          : DateTime.now(),
      gender:
          json['gender'] != null ? Gender.values[json['gender']] : Gender.none,
      phone: json['phone'] ?? '',
      mail: json['mail'] ?? '',
      code_activation: json['code_activation'] ?? '',
      active: json['active'] ?? false,
      member_plan_subscriptions: CommonHelperMethod.jsonContainsAndNotNullKey(
              json, 'member_plan_subscriptions')
          ? (json['member_plan_subscriptions'] as List)
              .map((e) => _memberPlanSubscriptionMapper.fromJson(e))
              .toList()
          : [],
      member_home_trainings: CommonHelperMethod.jsonContainsAndNotNullKey(
              json, 'member_home_trainings')
          ? (json['member_home_trainings'] as List)
              .map((e) => _homeTrainingMapper.fromJson(e))
              .toList()
          : [],
      indoor_training_subscription:
          CommonHelperMethod.jsonContainsAndNotNullKey(
                  json, 'indoor_training_subscription')
              ? (json['indoor_training_subscription'] as List)
                  .map((e) => _indoorTrainingSubscriptionMapper.fromJson(e))
                  .toList()
              : [],
      address: CommonHelperMethod.jsonContainsAndNotNullKey(json, 'address')
          ? _addressMapper.fromJson(json['address'])
          : null,
      credential:
          CommonHelperMethod.jsonContainsAndNotNullKey(json, 'credential')
              ? _credentialMapper.fromJson(json['credential'])
              : null,
      member_card:
          CommonHelperMethod.jsonContainsAndNotNullKey(json, 'member_card')
              ? _memberCardMapper.fromJson(json['member_card'])
              : null,
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
        member_plan_subscriptions: model.member_plan_subscriptions != []
            ? model.member_plan_subscriptions
                .map((e) => _memberPlanSubscriptionMapper.toEntity(e))
                .toList()
            : [],
        member_home_trainings: model.member_home_trainings != []
            ? model.member_home_trainings
                .map((e) => _homeTrainingMapper.toEntity(e))
                .toList()
            : [],
        indoor_training_subscription: model.indoor_training_subscription != []
            ? model.indoor_training_subscription
                .map((e) => _indoorTrainingSubscriptionMapper.toEntity(e))
                .toList()
            : [],
        address: model.address != null
            ? _addressMapper.toEntity(model.address!)
            : AddressEntity.empty(),
        credential: model.credential != null
            ? _credentialMapper.toEntity(model.credential!)
            : CredentialEntity.empty(),
        member_card: model.member_card != null
            ? _memberCardMapper.toEntity(model.member_card!)
            : MemberCardEntity.empty(),
        is_empty: false);
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
      'member_plan_subscriptions': model.member_plan_subscriptions != []
          ? model.member_plan_subscriptions
              .map((e) => _memberPlanSubscriptionMapper.toJson(e))
              .toList()
          : [],
      'member_home_trainings': model.member_home_trainings != []
          ? model.member_home_trainings
              .map((e) => _homeTrainingMapper.toJson(e))
              .toList()
          : [],
      'indoor_training_subscription': model.indoor_training_subscription != []
          ? model.indoor_training_subscription
              .map((e) => _indoorTrainingSubscriptionMapper.toJson(e))
              .toList()
          : [],
      'address':
          model.address != null ? _addressMapper.toJson(model.address!) : {},
      'credential': model.credential != null
          ? _credentialMapper.toJson(model.credential!)
          : {},
      'member_card': model.member_card != null
          ? _memberCardMapper.toJson(model.member_card!)
          : {},
    };
  }
}
