import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/auth/domain/usecase/auth_usecase.dart';
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
      print(
          "--------------------------ENTER TRY---------------------------------------------");
      final response = await authUseCase.signUp(data);
      print(
          "--------------------------RESPONSE----------------------------------------------");
      print(response);
      print(
          "--------------------------------------------------------------------------------");
      if (response is bool && response == true) {
        print(
            "--------------------------IF TRUE---------------------------------------------------");
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

  FutureOr<void> _onRegisterByGoogle(
      RegisterByGoogleEvent event, Emitter<RegisterState> emit) async {}

  FutureOr<void> _onRegisterByFacebook(
      RegisterByFacebookEvent event, Emitter<RegisterState> emit) async {}
}
