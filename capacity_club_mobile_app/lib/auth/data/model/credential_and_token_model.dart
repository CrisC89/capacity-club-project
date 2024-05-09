import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:equatable/equatable.dart';

class CredentialAndTokenModel extends Equatable {
  final String token;
  final String refreshToken;
  final CredentialModel credential;

  const CredentialAndTokenModel({
    required this.token,
    required this.refreshToken,
    required this.credential,
  });

  factory CredentialAndTokenModel.fromJson(Map<String, dynamic> json) {
    return CredentialAndTokenModel(
      token: json['token'],
      refreshToken: json['refreshToken'],
      credential: CredentialModel.fromJson(json['credential']),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'refreshToken': refreshToken,
        'credential': credential.toJson(),
      };

  @override
  List<Object?> get props => [];
}
