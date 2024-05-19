part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginByMailEvent extends LoginEvent {}

class LoginByGoogleEvent extends LoginEvent {}

class LoginByFacebookEvent extends LoginEvent {}
