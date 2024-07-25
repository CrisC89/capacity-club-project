import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/view-state/home_training_page_error_view.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_training_page_event.dart';
part 'home_training_page_state.dart';

class HomeTrainingPageBloc
    extends Bloc<HomeTrainingPageEvent, HomeTrainingPageState> {
  HomeTrainingPageBloc() : super(HomeTrainingPageInitial()) {
    on<HomeTrainingPageInitEvent>(_onInitTrainingPage);
  }

  FutureOr<void> _onInitTrainingPage(HomeTrainingPageInitEvent event,
      Emitter<HomeTrainingPageState> emit) async {
    try {
      emit(HomeTrainingPageLoadedState());
    } catch (e) {
      emit(HomeTrainingPageErrorState());
    }
  }
}
