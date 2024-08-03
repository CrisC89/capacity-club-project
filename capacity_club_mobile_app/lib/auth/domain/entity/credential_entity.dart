import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class CredentialEntity {
  final UniqueId credential_id;
  final String username;
  final String googleHash;
  final String facebookHash;
  final bool is_admin;
  final bool is_active;
  final MemberEntity member;
  final bool is_empty;

  const CredentialEntity(
      {required this.credential_id,
      required this.username,
      required this.googleHash,
      required this.facebookHash,
      required this.is_admin,
      required this.is_active,
      required this.member,
      required this.is_empty});

  factory CredentialEntity.empty() {
    return CredentialEntity(
        credential_id: UniqueId(''),
        username: '',
        googleHash: '',
        facebookHash: '',
        is_admin: false,
        is_active: false,
        member: MemberEntity.empty(),
        is_empty: true);
  }
}
