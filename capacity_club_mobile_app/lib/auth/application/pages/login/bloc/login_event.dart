part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginByMailEvent extends LoginEvent {
  final SignInRequest signInRequest;
  LoginByMailEvent({required this.signInRequest});

  @override
  List<Object> get props => [signInRequest];
}

class LoginByGoogleEvent extends LoginEvent {}

class LoginByFacebookEvent extends LoginEvent {}
