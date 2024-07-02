part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginByUsernameEvent extends LoginEvent {
  final SignInRequest signInRequest;
  LoginByUsernameEvent({required this.signInRequest});

  @override
  List<Object> get props => [signInRequest];
}

class LoginByGoogleEvent extends LoginEvent {
  final SignInRequest signInRequest;
  LoginByGoogleEvent({required this.signInRequest});

  @override
  List<Object> get props => [signInRequest];
}

class LoginByFacebookEvent extends LoginEvent {
  final SignInRequest signInRequest;
  LoginByFacebookEvent({required this.signInRequest});

  @override
  List<Object> get props => [signInRequest];
}
