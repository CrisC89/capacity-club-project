import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_profile_page_event.dart';
part 'user_profile_page_state.dart';

class UserProfilePageBloc
    extends Bloc<UserProfilePageEvent, UserProfilePageState> {
  UserProfilePageBloc() : super(UserProfilePageInitial()) {
    on<UserProfilePageInitEvent>(_onInitUserProfile);
  }

  FutureOr<void> _onInitUserProfile(UserProfilePageInitEvent event,
      Emitter<UserProfilePageState> emit) async {
    try {
      emit(UserProfilePageLoadedState());
    } catch (e) {
      emit(UserProfilePageErrorState());
    }
  }
}
