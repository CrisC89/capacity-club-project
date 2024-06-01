import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';

class SignupRequestBuilder {
  String _mail = '';
  String _password = '';
  String _googleHash = '';
  String _facebookHash = '';

  SignupRequestBuilder setFacebookHash(String value) {
    _facebookHash = value;
    return this;
  }

  SignupRequestBuilder setGoogleHash(String value) {
    _googleHash = value;
    return this;
  }

  SignupRequestBuilder setPassword(String value) {
    _password = value;
    return this;
  }

  SignupRequestBuilder setMail(String value) {
    _mail = value;
    return this;
  }

  SignupRequest build() {
    return SignupRequest(_mail, _password, _googleHash, _facebookHash);
  }
}
