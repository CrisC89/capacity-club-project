import 'package:capacity_club_mobile_app/auth/domain/entity/credential_entity.dart';

class CredentialAndTokenEntity {
  final String token;
  final String refreshToken;
  final CredentialEntity credential;

  const CredentialAndTokenEntity({
    required this.token,
    required this.refreshToken,
    required this.credential,
  });

  factory CredentialAndTokenEntity.empty() {
    return CredentialAndTokenEntity(
        token: '', refreshToken: '', credential: CredentialEntity.empty());
  }
}
