import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'setting_page_event.dart';
part 'setting_page_state.dart';

class SettingPageBloc extends Bloc<SettingPageEvent, SettingPageState> {
  SettingPageBloc() : super(SettingPageInitial()) {
    on<SettingPageInitEvent>(_onInitSettingPage);
  }

  FutureOr<void> _onInitSettingPage(
      SettingPageInitEvent event, Emitter<SettingPageState> emit) async {
    try {
      emit(SettingPageLoadedState());
    } catch (e) {
      emit(SettingPageErrorState());
    }
  }
}
