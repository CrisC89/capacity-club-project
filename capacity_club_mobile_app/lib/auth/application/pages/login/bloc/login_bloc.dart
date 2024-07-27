import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/model/payload/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/domain/usecase/auth_usecase.dart';
import 'package:capacity_club_mobile_app/core/config/logger/bloc_loggers.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:dio/dio.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase authUseCase;
  LoginBloc({required this.authUseCase}) : super(LoginInitial()) {
    on<LoginByUsernameEvent>(_onLoginByUsername);
    on<LoginByGoogleEvent>(_onLoginByGoogle);
    on<LoginByFacebookEvent>(_onLoginByFacebook);
  }

  FutureOr<void> _onLoginByUsername(
      LoginByUsernameEvent event, Emitter<LoginState> emit) async {
    SignInRequest data = event.signInRequest;
    try {
      final response = await authUseCase.signIn(data);

      response.fold(
        (failure) {
          // Gérer l'échec
          loginBlocLogger.e('Login failed with failure: $failure');
          emit(LoginFailureState(
              stackTrace:
                  'Login failure')); // Vous pouvez émettre un état de défaillance avec des détails
        },
        (success) {
          // Gérer le succès
          if (success) {
            AuthProvider().login();
            loginBlocLogger.i('Login successful: $success');
            emit(
                LoginSuccessState()); // Vous pouvez émettre un état de succès ici
          } else {
            loginBlocLogger.e('Login failed with response: $success');
            emit(LoginFailureState(
                stackTrace:
                    'credetnial nbot found')); // Émettre un état de défaillance spécifique si nécessaire
          }
        },
      );
    } on DioException catch (e) {
      // Détails de l'erreur pour les exceptions Dio
      String errorMessage = 'DioError: ';
      if (e.response != null) {
        errorMessage += 'Status Code: ${e.response?.statusCode}, ';
        errorMessage += 'Response Data: ${e.response?.data}';
      } else {
        errorMessage += 'Message: ${e.message}';
      }
      loginBlocLogger.e(errorMessage);
      emit(LoginFailureState(
          stackTrace:
              errorMessage)); // Vous pouvez également émettre un état d'échec spécifique ici
    } catch (e) {
      // Gestion des autres exceptions
      loginBlocLogger.e('Unexpected error: ${e.toString()}');
      emit(LoginFailureState(
          stackTrace:
              'erreur inattendue')); // Émettre un état d'échec pour les erreurs inattendues
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
