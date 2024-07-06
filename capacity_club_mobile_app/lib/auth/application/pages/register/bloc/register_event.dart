part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterByUsernameEvent extends RegisterEvent {
  final SignUpRequest signUpRequest;
  RegisterByUsernameEvent({required this.signUpRequest});

  @override
  List<Object> get props => [signUpRequest];
}

class RegisterByGoogleEvent extends RegisterEvent {
  RegisterByGoogleEvent();
}

class RegisterByFacebookEvent extends RegisterEvent {
  RegisterByFacebookEvent();
}
