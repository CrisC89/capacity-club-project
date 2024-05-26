import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/builder/sign_in_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/domain/usecase/auth_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginGenericState> {
  final AuthUseCase authUseCase;
  LoginBloc({required this.authUseCase})
      : super(LoginGenericState(
            email: '',
            password: '',
            message: '',
            status: LoginStatus.initial)) {
    on<LoginMailChangedEvent>(_onLoginMailChanged);
    on<LoginPasswordChangedEvent>(_onLoginPasswordChanged);
    on<LoginByMailEvent>(_onLoginByMail);
  }

  FutureOr<void> _onLoginMailChanged(
      LoginMailChangedEvent event, Emitter<LoginGenericState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onLoginPasswordChanged(
      LoginPasswordChangedEvent event, Emitter<LoginGenericState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _onLoginByMail(
      LoginByMailEvent event, Emitter<LoginGenericState> emit) async {
    emit(
        state.copyWith(status: LoginStatus.loading, message: 'Submitting ...'));
    SignInRequest data = SignInRequestBuilder()
        .setMail(state.email)
        .setPassword(state.password)
        .build();

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
        emit(state.copyWith(
            status: LoginStatus.succes, message: 'Login successfull'));
      } else {
        print(
            "--------------------------ELSE--------------------------------------------------");
        emit(state.copyWith(status: LoginStatus.error, message: 'error'));
      }
    } catch (e) {
      print(
          "-----------------------------ERROR---------------------------------------------");
      print(e.toString());
      print(
          "--------------------------------------------------------------------------------");
      emit(state.copyWith(status: LoginStatus.error, message: e.toString()));
    }
  }
}
