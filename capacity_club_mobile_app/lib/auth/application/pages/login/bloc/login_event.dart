part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginMailChangedEvent extends LoginEvent {
  final String email;
  LoginMailChangedEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginPasswordChangedEvent extends LoginEvent {
  final String password;
  LoginPasswordChangedEvent({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginByMailEvent extends LoginEvent {}

class LoginByGoogleEvent extends LoginEvent {}

class LoginByFacebookEvent extends LoginEvent {}
