import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';

class CredentialEntity {
  final UniqueId credential_id;
  final String username;
  final String googleHash;
  final String facebookHash;
  final bool isAdmin;

  const CredentialEntity(
      {required this.credential_id,
      required this.username,
      required this.googleHash,
      required this.facebookHash,
      required this.isAdmin});

  factory CredentialEntity.empty() {
    return CredentialEntity(
        credential_id: UniqueId(''),
        username: '',
        googleHash: '',
        facebookHash: '',
        isAdmin: false);
  }
}
