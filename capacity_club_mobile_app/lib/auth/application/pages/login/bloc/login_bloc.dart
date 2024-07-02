import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/builder/sign_in_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_and_token_model.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/domain/usecase/auth_usecase.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';

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
      print(
          "--------------------------ENTER TRY---------------------------------------------");
      final response = await authUseCase.signIn(data);
      print(
          "--------------------------RESPONSE----------------------------------------------");
      print(response);
      print(
          "--------------------------------------------------------------------------------");
      if (response is bool && response == true) {
        print(
            "--------------------------IF-------------------------------R--------------------");
      } else {
        print(
            "--------------------------ELSE--------------------------------------------------");
      }
    } catch (e) {
      print(
          "-----------------------------ERROR---------------------------------------------");
      print(e.toString());
      print(
          "--------------------------------------------------------------------------------");
    }
  }

  FutureOr<void> _onLoginByGoogle(
      LoginByGoogleEvent event, Emitter<LoginState> emit) async {}
  FutureOr<void> _onLoginByFacebook(
      LoginByFacebookEvent event, Emitter<LoginState> emit) async {}
}
