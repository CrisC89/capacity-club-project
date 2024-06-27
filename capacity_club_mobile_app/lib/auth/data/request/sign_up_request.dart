import 'package:capacity_club_mobile_app/common/model/abstract/payload.dart';

class SignupRequest extends Payload {
  final String mail;
  final String password;
  final String googleHash;
  final String facebookHash;

  SignupRequest(this.mail, this.password, this.googleHash, this.facebookHash);

  SignupRequest.fromJson(Map<String, dynamic> json)
      : mail = json['mail'],
        password = json['password'],
        googleHash = json['googleHash'],
        facebookHash = json['facebookHash'];

  Map<String, dynamic> toJson() => {
        'mail': mail,
        'password': password,
        'googleHash': googleHash,
        'facebookHash': facebookHash,
      };
}
