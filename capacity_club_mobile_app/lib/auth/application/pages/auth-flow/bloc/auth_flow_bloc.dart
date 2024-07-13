import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_and_token_model.dart';
import 'package:capacity_club_mobile_app/auth/domain/usecase/auth_usecase.dart';
import 'package:capacity_club_mobile_app/core/config/logger/bloc_loggers.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/core/gorouter/go_router.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';

part 'auth_flow_event.dart';
part 'auth_flow_state.dart';

class AuthFlowBloc extends Bloc<AuthFlowEvent, AuthFlowState> {
  final AuthUseCase authUseCase;
  AuthFlowBloc({required this.authUseCase}) : super(AuthFlowInitial()) {
    on<AuthFlowCheckUserEvent>(_checkUser);
    on<AuthFlowCheckStateEvent>(_checkState);
  }
  final authProvider = AuthProvider();
  FutureOr<void> _checkUser(
      AuthFlowCheckUserEvent event, Emitter<AuthFlowState> emit) async {
    try {
      final token = await authProvider.getToken();
      if (token != null) {
        authFlowBlocLogger.e('TOKEN $token');
        final userData = CredentialAndTokenModel.fromJson(jsonDecode(token));
        final result = await authUseCase.me();

        authFlowBlocLogger.e('ME RESPONSE $result');
        result.fold(
          (failure) {
            authProvider.clearUser();
            emit(AuthFlowFailure(router: publicRouter));
          },
          (response) {
            if (response.result) {
              authProvider.setUser(userData);
              emit(AuthFlowSuccess(router: privateRouter));
            } else {
              authProvider.clearUser();
              emit(AuthFlowFailure(router: publicRouter));
            }
          },
        );
      } else {
        // Si le token est null, nettoyer les informations utilisateur et émettre un état d'échec
        authProvider.clearUser();
        emit(AuthFlowFailure(router: publicRouter));
      }
    } catch (e) {
      authFlowBlocLogger.e('ERROR ${e.toString()}');
      authProvider
          .clearUser(); // Nettoyer les informations utilisateur en cas d'erreur
      emit(AuthFlowFailure(router: publicRouter));
    }
  }

  FutureOr<void> _checkState(
      AuthFlowCheckStateEvent event, Emitter<AuthFlowState> emit) async {
    final isLogged = authProvider.isLoggedIn;
    if (isLogged) {
      emit(AuthFlowSuccess(router: privateRouter));
    } else {
      emit(AuthFlowFailure(router: publicRouter));
    }
  }
}
