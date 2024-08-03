import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/auth/domain/entity/credential_entity.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/mapper/member_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class CredentialMapper with Mapper<CredentialModel, CredentialEntity> {
  final MemberMapper _memberMapper = MemberMapper();
  @override
  CredentialModel fromEntity(CredentialEntity entity) {
    return CredentialModel(
        credential_id: entity.credential_id,
        username: entity.username,
        googleHash: entity.googleHash,
        facebookHash: entity.facebookHash,
        is_admin: entity.is_admin,
        is_active: entity.is_active,
        member:
            entity.is_empty ? null : _memberMapper.fromEntity(entity.member));
  }

  @override
  CredentialModel fromJson(Map<String, dynamic> json) {
    // Création de l'objet CredentialModel
    return CredentialModel(
        credential_id: UniqueId.fromJson(json['credential_id']),
        username: json['username'] as String,
        googleHash: json['googleHash'] as String,
        facebookHash: json['facebookHash'] as String,
        is_admin: json['is_admin'] as bool,
        is_active: json['is_active'] as bool,
        member: json.containsKey('member') && json['member'] != null
            ? _memberMapper.fromJson(json['member'])
            : null);
  }

  @override
  CredentialEntity toEntity(CredentialModel model) {
    return CredentialEntity(
        credential_id: model.credential_id,
        username: model.username,
        googleHash: model.googleHash,
        facebookHash: model.facebookHash,
        is_admin: model.is_admin,
        is_active: model.is_active,
        member: model.member != null
            ? _memberMapper.toEntity(model.member!)
            : MemberEntity.empty(),
        is_empty: false);
  }

  @override
  Map<String, dynamic> toJson(CredentialModel model) {
    return {
      'credential_id': model.credential_id.toJson(),
      'username': model.username,
      'googleHash': model.googleHash,
      'facebookHash': model.facebookHash,
      'is_admin': model.is_admin,
      'is_active': model.is_active,
      'member': model.member != null ? _memberMapper.toJson(model.member!) : ''
    };
  }
}
