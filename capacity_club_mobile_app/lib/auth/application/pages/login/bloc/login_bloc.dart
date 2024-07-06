import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/domain/usecase/auth_usecase.dart';
import 'package:capacity_club_mobile_app/common/config/logger/bloc_loggers.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase authUseCase;
  LoginBloc({required this.authUseCase}) : super(LoginInitial()) {
    on<LoginByUsernameEvent>(_onLoginByMail);
    on<LoginByGoogleEvent>(_onLoginByGoogle);
    on<LoginByFacebookEvent>(_onLoginByFacebook);
  }

  FutureOr<void> _onLoginByMail(
      LoginByUsernameEvent event, Emitter<LoginState> emit) async {
    SignInRequest data = event.signInRequest;
    try {
      final response = await authUseCase.signIn(data);
      if (response is bool && response == true) {
        loginBlocLogger.e(response);
      } else {
        loginBlocLogger.e(response);
      }
    } catch (e) {
      loginBlocLogger.e('ERROR ${e.toString()}');
    }
  }

  FutureOr<void> _onLoginByGoogle(
      LoginByGoogleEvent event, Emitter<LoginState> emit) async {
    try {
      final response = await authUseCase.signInWithGoogle();
      if (response is bool && response == true) {
        loginBlocLogger.e(response);
      } else {
        loginBlocLogger.e(response);
      }
    } catch (e) {
      loginBlocLogger.e('ERROR ${e.toString()}');
    }
  }

  FutureOr<void> _onLoginByFacebook(
      LoginByFacebookEvent event, Emitter<LoginState> emit) async {
    try {
      final response = await authUseCase.signInWithFacebook();
      if (response is bool && response == true) {
        loginBlocLogger.e(response);
      } else {
        loginBlocLogger.e(response);
      }
    } catch (e) {
      loginBlocLogger.e('ERROR ${e.toString()}');
    }
  }
}
