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
    /*CREDENTIAL AND TOKEN JSON*/
    print('ENTER CREDENTIAL AND TOKEN JSON');

    final token = json['token'];
    final refreshToken = json['refreshToken'];
    final credential = json['credential'];

    return CredentialAndTokenModel(
      token: token as String,
      refreshToken: refreshToken as String,
      credential: CredentialModel.fromJson(credential as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'refreshToken': refreshToken,
        'credential': credential.toJson(),
      };

  @override
  List<Object?> get props => [token, refreshToken, credential];
}
