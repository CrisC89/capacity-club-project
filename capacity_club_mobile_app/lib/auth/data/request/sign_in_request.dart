import 'package:capacity_club_mobile_app/common/model/abstract/payload.dart';

class SignInRequest extends Payload {
  final String mail;
  final String password;

  final String googleHash;
  final String facebookHash;

  final bool socialLogin;

  SignInRequest(this.mail, this.password, this.googleHash, this.facebookHash,
      this.socialLogin);

  SignInRequest.fromJson(Map<String, dynamic> json)
      : mail = json['mail'],
        password = json['password'],
        googleHash = json['googleHash'],
        facebookHash = json['facebookHash'],
        socialLogin = json['socialLogin'];

  Map<String, dynamic> toJson() => {
        'mail': mail,
        'password': password,
        'googleHash': googleHash,
        'facebookHash': facebookHash,
        'socialLogin': socialLogin
      };
}
