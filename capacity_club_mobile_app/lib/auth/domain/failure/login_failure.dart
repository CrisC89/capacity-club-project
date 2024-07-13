import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';

class LoginFailure implements Failure {
  String _message = 'login failure';
  String get message => _message;
}
