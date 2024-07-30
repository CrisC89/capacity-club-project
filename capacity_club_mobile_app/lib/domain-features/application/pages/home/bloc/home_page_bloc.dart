import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/params/collective_indoor_training_filter_params.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/params/individual_indoor_training_filter_params.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/usecase/get_collective_indoor_training_list_by_date.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/usecase/get_individual_indoor_training_list_by_date.dart';
import 'package:either_dart/either.dart';
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

    on<HomePageDateChangedEvent>(_onHomePageDateChanged);
  }

  FutureOr<void> _onInitHomePage(
      HomePageInitEvent event, Emitter<HomePageState> emit) async {
    try {
      final DateTime currentDate2 =
          event.currentDate.add(const Duration(days: 1));
      final DateTime trainingDate = DateTime(
          currentDate2.year, currentDate2.month, currentDate2.day, 0, 0, 0);
      final IndividualIndoorTrainingDateParams
          individualIndoorTrainingDateParams =
          IndividualIndoorTrainingDateParams(training_date: trainingDate);
      final CollectiveIndoorTrainingDateParams
          collectiveIndoorTrainingDateParams =
          CollectiveIndoorTrainingDateParams(training_date: trainingDate);

      final Either<Failure, List<IndoorTrainingEntity>> collectiveResponse =
          await getCollectiveIndoorTrainingListByDate(
              collectiveIndoorTrainingDateParams);

      final Either<Failure, List<IndoorTrainingEntity>> individualResponse =
          await getIndividualIndoorTrainingListByDate(
              individualIndoorTrainingDateParams);

      final List<IndoorTrainingEntity> collectiveIndoorTraining =
          collectiveResponse.fold(
        (failure) {
          print('BLOC COLLECTIVE FAILURE');
          return [];
        },
        (data) => data.map((entity) {
          return IndoorTrainingEntity(
            indoor_training_id: entity.indoor_training_id,
            title: entity.title,
            training_date: entity.training_date,
            start_hours: entity.start_hours,
            end_hours: entity.end_hours,
            nb_place: entity.nb_place,
            nb_subscription: entity.nb_subscription,
            is_collective: entity.is_collective,
            is_user_registred: false,
            workout: entity.workout,
          );
        }).toList(),
      );

      final List<IndoorTrainingEntity> individualIndoorTraining =
          individualResponse.fold(
        (failure) {
          print('BLOC INDIVIDUAL FAILURE');
          return [];
        },
        (data) => data.map((entity) {
          return IndoorTrainingEntity(
            indoor_training_id: entity.indoor_training_id,
            title: entity.title,
            training_date: entity.training_date,
            start_hours: entity.start_hours,
            end_hours: entity.end_hours,
            nb_place: entity.nb_place,
            nb_subscription: entity.nb_subscription,
            is_collective: entity.is_collective,
            is_user_registred: false,
            workout: entity.workout,
          );
        }).toList(),
      );

      emit(HomePageLoadedState(
        collectiveIndoorTraining: collectiveIndoorTraining,
        individualIndoorTraining: individualIndoorTraining,
      ));
    } catch (e) {
      emit(HomePageErrorState());
    }
  }

  FutureOr<void> _onHomePageDateChanged(
      HomePageDateChangedEvent event, Emitter<HomePageState> emit) async {
    emit(HomePageLoadingState());
    try {
      final selectedDate2 = event.selectedDate.add(const Duration(days: 1));
      final DateTime trainingDate = DateTime(
          selectedDate2.year, selectedDate2.month, selectedDate2.day, 0, 0, 0);
      final IndividualIndoorTrainingDateParams
          individualIndoorTrainingDateParams =
          IndividualIndoorTrainingDateParams(training_date: trainingDate);
      final CollectiveIndoorTrainingDateParams
          collectiveIndoorTrainingDateParams =
          CollectiveIndoorTrainingDateParams(training_date: trainingDate);

      final Either<Failure, List<IndoorTrainingEntity>> collectiveResponse =
          await getCollectiveIndoorTrainingListByDate(
              collectiveIndoorTrainingDateParams);

      final Either<Failure, List<IndoorTrainingEntity>> individualResponse =
          await getIndividualIndoorTrainingListByDate(
              individualIndoorTrainingDateParams);

      final List<IndoorTrainingEntity> collectiveIndoorTraining =
          collectiveResponse.fold(
        (failure) {
          print('BLOC COLLECTIVE FAILURE');
          return [];
        },
        (data) => data.map((entity) {
          return IndoorTrainingEntity(
            indoor_training_id: entity.indoor_training_id,
            title: entity.title,
            training_date: entity.training_date,
            start_hours: entity.start_hours,
            end_hours: entity.end_hours,
            nb_place: entity.nb_place,
            nb_subscription: entity.nb_subscription,
            is_collective: entity.is_collective,
            is_user_registred: false,
            workout: entity.workout,
          );
        }).toList(),
      );

      final List<IndoorTrainingEntity> individualIndoorTraining =
          individualResponse.fold(
        (failure) {
          print('BLOC INDIVIDUAL FAILURE');
          return [];
        },
        (data) => data.map((entity) {
          return IndoorTrainingEntity(
            indoor_training_id: entity.indoor_training_id,
            title: entity.title,
            training_date: entity.training_date,
            start_hours: entity.start_hours,
            end_hours: entity.end_hours,
            nb_place: entity.nb_place,
            nb_subscription: entity.nb_subscription,
            is_collective: entity.is_collective,
            is_user_registred: false,
            workout: entity.workout,
          );
        }).toList(),
      );

      emit(HomePageLoadedState(
        collectiveIndoorTraining: collectiveIndoorTraining,
        individualIndoorTraining: individualIndoorTraining,
      ));
    } catch (e) {
      emit(HomePageErrorState());
    }
  }
}
