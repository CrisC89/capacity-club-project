import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/usecase/get_collective_indoor_training_list_by_date.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/usecase/get_individual_indoor_training_list_by_date.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetIndividualIndoorTrainingListByDate
      getIndividualIndoorTrainingListByDate;
  final GetCollectiveIndoorTrainingListByDate
      getCollectiveIndoorTrainingListByDate;
  HomePageBloc({
    required this.getIndividualIndoorTrainingListByDate,
    required this.getCollectiveIndoorTrainingListByDate,
  }) : super(HomePageInitial()) {
    on<HomePageInitEvent>(_onInitHomePage);
  }

  FutureOr<void> _onInitHomePage(
      HomePageInitEvent event, Emitter<HomePageState> emit) async {
    try {
      emit(HomePageLoadedState());
    } catch (e) {
      emit(HomePageErrorState());
    }
  }
}
