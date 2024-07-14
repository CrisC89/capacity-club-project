import 'package:capacity_club_mobile_app/auth/data/model/payload/sign_in_request.dart';

class SignInRequestBuilder {
  String _username = '';
  String _password = '';
  String _googleHash = "";
  String _facebookHash = "";
  final bool _socialLogin = false;

  SignInRequestBuilder setUsername(String value) {
    _username = value;
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
        _username, _password, _googleHash, _facebookHash, _socialLogin);
  }
}
