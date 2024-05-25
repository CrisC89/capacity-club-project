import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';

class SignInRequestBuilder {
  String _mail = '';
  String _password = '';
  String _googleHash = "";
  String _facebookHash = "";
  final bool _socialLogin = false;

  SignInRequestBuilder setMail(String value) {
    _mail = value;
    return this;
  }

  SignInRequestBuilder setFacebookHash(String value) {
    _facebookHash = value;
    return this;
  }

  SignInRequestBuilder setGoogleHash(String value) {
    _googleHash = value;
    return this;
  }

  SignInRequestBuilder setPassword(String value) {
    _password = value;
    return this;
  }

  SignInRequest build() {
    return SignInRequest(
        _mail, _password, _googleHash, _facebookHash, _socialLogin);
  }
}
