import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';

class LoginFailure extends Failure {
  String _message = 'login failure';
  String get message => _message;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
