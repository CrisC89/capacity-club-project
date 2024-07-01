import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';

class SignUpRequestBuilder {
  String _username = '';
  String _password = '';
  String _googleHash = '';
  String _facebookHash = '';

  SignUpRequestBuilder setFacebookHash(String value) {
    _facebookHash = value;
    return this;
  }

  SignUpRequestBuilder setGoogleHash(String value) {
    _googleHash = value;
    return this;
  }

  SignUpRequestBuilder setPassword(String value) {
    _password = value;
    return this;
  }

  SignUpRequestBuilder setUsername(String value) {
    _username = value;
    return this;
  }

  SignupRequest build() {
    return SignupRequest(_username, _password, _googleHash, _facebookHash);
  }
}
