import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/mock/mock_data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final IndoorTrainingMockRepository indoorTrainingUsecase =
      IndoorTrainingMockRepository();
  TestBloc() : super(TestInitial()) {
    on<OnInitTestEvent>(_onInit);
    on<OnDateChangedTestEvent>(_onDateChanged);
  }

  FutureOr<void> _onDateChanged(
      OnDateChangedTestEvent event, Emitter<TestState> emit) async {
    try {
      final collection = await indoorTrainingUsecase.getListWorkouts();

      if (collection.isLeft) {
        emit(TestErrorState());
      } else {
        List<Map<String, dynamic>> collectiveIndoorTrainingList = [];
        List<Map<String, dynamic>> individualIndoorTrainingList = [];

        for (var training in collection.right) {
          if (training['isCollective'] == true) {
            collectiveIndoorTrainingList.add(training);
          } else {
            individualIndoorTrainingList.add(training);
          }
        }

        List<Map<String, dynamic>> uniqueCollectiveWorkouts =
            collectiveIndoorTrainingList.toSet().toList().take(7).toList();

        List<Map<String, dynamic>> uniqueIndividualWorkouts =
            individualIndoorTrainingList.toSet().toList().take(7).toList();
        emit(TestLoadedState(
          collectiveIndoorTrainingList: uniqueCollectiveWorkouts,
          individualIndoorTrainingList: uniqueIndividualWorkouts,
        ));
      }
    } on Exception catch (e) {
      emit(TestErrorState());
    }
  }

  FutureOr<void> _onInit(OnInitTestEvent event, Emitter<TestState> emit) async {
    try {
      var collection = await indoorTrainingUsecase.getListWorkouts();
      if (collection.isLeft) {
        emit(TestErrorState());
      } else {
        //emit(TestLoadedState(indoorTrainingList: collection.right));
      }
    } catch (e) {
      emit(TestErrorState());
    }
  }
}
