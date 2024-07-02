import 'package:capacity_club_mobile_app/common/model/abstract/payload.dart';

class SignUpRequest extends Payload {
  final String username;
  final String password;
  final String googleHash;
  final String facebookHash;

  SignUpRequest(
      this.username, this.password, this.googleHash, this.facebookHash);

  SignUpRequest.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        googleHash = json['googleHash'],
        facebookHash = json['facebookHash'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'googleHash': googleHash,
        'facebookHash': facebookHash,
      };
}
