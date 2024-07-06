import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/auth/domain/usecase/auth_usecase.dart';
import 'package:capacity_club_mobile_app/common/config/logger/bloc_loggers.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthUseCase authUseCase;
  RegisterBloc({required this.authUseCase}) : super(RegisterInitial()) {
    on<RegisterByUsernameEvent>(_onRegisterByUsername);
    on<RegisterByGoogleEvent>(_onRegisterByGoogle);
    on<RegisterByFacebookEvent>(_onRegisterByFacebook);
  }

  FutureOr<void> _onRegisterByUsername(
      RegisterByUsernameEvent event, Emitter<RegisterState> emit) async {
    SignUpRequest data = event.signUpRequest;
    try {
      final response = await authUseCase.signUp(data);
      registerBlocLogger.e(response);
      if (response is bool && response == true) {
        registerBlocLogger.e(response);
      } else {
        registerBlocLogger.e(response);
      }
    } catch (e) {
      registerBlocLogger.e('ERROR ${e.toString()}');
    }
  }

  FutureOr<void> _onRegisterByGoogle(
      RegisterByGoogleEvent event, Emitter<RegisterState> emit) async {
    try {
      final response = await authUseCase.signUpWithGoogle();
      if (response is bool && response == true) {
        registerBlocLogger.e(response);
      } else {
        registerBlocLogger.e(response);
      }
    } catch (e) {
      registerBlocLogger.e(e.toString());
    }
  }

  FutureOr<void> _onRegisterByFacebook(
      RegisterByFacebookEvent event, Emitter<RegisterState> emit) async {
    try {
      final response = await authUseCase.signUpWithFacebook();
      if (response is bool && response == true) {
        registerBlocLogger.e(response);
      } else {
        registerBlocLogger.e(response);
      }
    } catch (e) {
      registerBlocLogger.e('ERROR ${e.toString()}');
    }
  }
}
