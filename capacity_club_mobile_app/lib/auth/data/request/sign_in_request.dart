import 'package:capacity_club_mobile_app/common/model/abstract/payload.dart';

class SignInRequest extends Payload {
  final String username;
  final String password;

  final String googleHash;
  final String facebookHash;

  final bool socialLogin;

  SignInRequest(this.username, this.password, this.googleHash,
      this.facebookHash, this.socialLogin);

  SignInRequest.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        googleHash = json['googleHash'],
        facebookHash = json['facebookHash'],
        socialLogin = json['socialLogin'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'googleHash': googleHash,
        'facebookHash': facebookHash,
        'socialLogin': socialLogin
      };
}
