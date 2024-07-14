import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/usecase/indoor_training_usecase.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IndoorTrainingUsecase indoorTrainingUsecase;
  HomeBloc({required this.indoorTrainingUsecase}) : super(HomeInitial()) {
    on<OnDateChangedHomeEvent>(_onDateChanged);
  }

  FutureOr<void> _onDateChanged(
      OnDateChangedHomeEvent event, Emitter<HomeState> emit) async {
    try {} catch (e) {}
  }
}
