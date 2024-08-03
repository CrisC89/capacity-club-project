import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';

class LoginFailure extends Failure {
  final String _message = 'login failure';
  String get message => _message;

  @override
  List<Object?> get props => [_message];
}
