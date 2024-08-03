import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';

class SignUpRequest extends Payload {
  final String username;
  final String password;
  final String googleHash;
  final String facebookHash;
  final String code_activation;

  SignUpRequest(this.username, this.password, this.googleHash,
      this.facebookHash, this.code_activation);

  SignUpRequest.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        googleHash = json['googleHash'],
        facebookHash = json['facebookHash'],
        code_activation = json['code_activation'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'googleHash': googleHash,
        'facebookHash': facebookHash,
        'code_activation': code_activation
      };
}
