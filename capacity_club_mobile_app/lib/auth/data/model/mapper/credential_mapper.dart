import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/auth/domain/entity/credential_entity.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/mapper/member_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class CredentialMapper {
  static CredentialModel fromEntity(CredentialEntity entity) {
    return CredentialModel(
        credential_id: entity.credential_id,
        username: entity.username,
        googleHash: entity.googleHash,
        facebookHash: entity.facebookHash,
        is_admin: entity.is_admin,
        is_active: entity.is_active,
        member:
            entity.is_empty ? null : MemberMapper.fromEntity(entity.member));
  }

  static CredentialModel fromJson(Map<String, dynamic> json) {
    print('ENTER MAPPER METHODE');
    print('JSON MEMBER');
    print(json['member']);
    final retval = CredentialModel(
        credential_id: UniqueId.fromJson(json['credential_id']),
        username: json['username'] as String,
        googleHash: json['googleHash'] as String,
        facebookHash: json['facebookHash'] as String,
        is_admin: json['is_admin'] as bool,
        is_active: json['is_active'] as bool,
        member: json.containsKey('member') && json['member'] != null
            ? MemberMapper.fromJson(json['member'])
            : null);
    print("return credential retval");
    return retval;
  }

  static CredentialEntity toEntity(CredentialModel model) {
    return CredentialEntity(
        credential_id: model.credential_id,
        username: model.username,
        googleHash: model.googleHash,
        facebookHash: model.facebookHash,
        is_admin: model.is_admin,
        is_active: model.is_active,
        member: model.member != null
            ? MemberMapper.toEntity(model.member!)
            : MemberEntity.empty(),
        is_empty: false);
  }

  static Map<String, dynamic> toJson(CredentialModel model) {
    return {
      'credential_id': model.credential_id.toJson(),
      'username': model.username,
      'googleHash': model.googleHash,
      'facebookHash': model.facebookHash,
      'is_admin': model.is_admin,
      'is_active': model.is_active,
      'member': model.member != null ? MemberMapper.toJson(model.member!) : ''
    };
  }
}
