import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/builder/sign_in_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/common/utils/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginGenericState> {
  LoginBloc()
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

    print(
        "--------------------------------------------------------------------------------");
    print(
        "--------------------------MAIL---------------------------------------------");
    print(data.mail);
    print(
        "--------------------------------------------------------------------------------");

    print(
        "--------------------------------------------------------------------------------");
    print(
        "--------------------------PWD---------------------------------------------");

    print(data.password);
    print(
        "--------------------------------------------------------------------------------");
    print(data.toJson());

    try {
      print(
          "--------------------------------------------------------------------------------");
      print(
          "--------------------------ENTER TRY---------------------------------------------");
      print(
          "--------------------------------------------------------------------------------");
      final response = await DioClient().getClient.post(
          'http://localhost:3000/api/authenticated/signin',
          data: jsonEncode(data));
      print(
          "--------------------------------------------------------------------------------");
      print(
          "--------------------------RESPONSE----------------------------------------------");
      print(response.data);
      print(
          "--------------------------------------------------------------------------------");
      if (response.statusCode == 200) {
        emit(state.copyWith(
            status: LoginStatus.succes, message: 'Login successfull'));
      } else {
        emit(state.copyWith(
            status: LoginStatus.error, message: response.data['error']));
      }
    } catch (e) {
      print(
          "--------------------------------------------------------------------------------");
      print(
          "-----------------------------ERROR---------------------------------------------");
      print(e.toString());
      print(
          "--------------------------------------------------------------------------------");
      emit(state.copyWith(status: LoginStatus.error, message: e.toString()));
    }
  }
}
