import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/core/routing/go_router.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';

part 'auth_flow_event.dart';
part 'auth_flow_state.dart';

class AuthFlowBloc extends Bloc<AuthFlowEvent, AuthFlowState> {
  AuthFlowBloc() : super(AuthFlowInitial()) {
    on<AuthFlowEvent>((event, emit) {
      bool isUserLoggedIn = AuthProvider().isLoggedIn;
      if (isUserLoggedIn) {
        emit(AuthFlowSuccess(router: privateRouter));
      } else {
        emit(AuthFlowFailure(router: publicRouter));
      }
    });
  }
}
