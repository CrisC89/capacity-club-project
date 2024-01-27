import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/core/contract/usecase.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/usecase/read-all-collective-training-session.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'collective_training_session_event.dart';
part 'collective_training_session_state.dart';

class CollectiveTrainingSessionBloc extends Bloc<CollectiveTrainingSessionEvent,
    CollectiveTrainingSessionState> {
  final ReadAllCollectiveTrainingSession readAllCollectiveTrainingSession;
  List<CollectiveTrainingSession> allSessions = [];

  CollectiveTrainingSessionBloc(
      {required this.readAllCollectiveTrainingSession})
      : super(CollectiveTrainingSessionStateLoading()) {
    on<CollectiveTrainingSessionRequestedEvent>(_onBackUp);
    on<CollectiveTrainingSessionFirstRequestedEvent>(_onFirstRequested);
    on<CollectiveTrainingSessionChangedDateEvent>(_dateChanged);
  }

  Future<void> _onBackUp(CollectiveTrainingSessionRequestedEvent event,
      Emitter<CollectiveTrainingSessionState> emit) async {
    emit(CollectiveTrainingSessionStateLoading());
    try {
      final sessions = await readAllCollectiveTrainingSession.call(NoParams());

      if (sessions.isLeft) {
        emit(CollectiveTrainingSessionStateError(message: 'Not found'));
      } else {
        emit(CollectiveTrainingSessionStateLoaded(sessions: sessions.right));
      }
    } on Exception {
      emit(CollectiveTrainingSessionStateError(message: 'Other error'));
    }
  }

  Future<void> _onFirstRequested(
      CollectiveTrainingSessionFirstRequestedEvent event,
      Emitter<CollectiveTrainingSessionState> emit) async {
    emit(CollectiveTrainingSessionStateLoading());
    try {
      final sessions = await readAllCollectiveTrainingSession.call(NoParams());

      if (sessions.isLeft) {
        emit(CollectiveTrainingSessionStateError(message: 'Not found'));
      } else {
        allSessions = sessions.right;
        final currentDate = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);
        add(CollectiveTrainingSessionChangedDateEvent(date: currentDate));
      }
    } on Exception {
      emit(CollectiveTrainingSessionStateError(message: 'Other error'));
    }
  }

  Future<void> _dateChanged(CollectiveTrainingSessionChangedDateEvent event,
      Emitter<CollectiveTrainingSessionState> emit) async {
    emit(CollectiveTrainingSessionStateLoading());
    try {
      final filteredSessions = allSessions
          .where((session) => session.training_date == event.date)
          .toList();
      if (filteredSessions.isEmpty) {
        emit(CollectiveTrainingSessionStateError(message: 'Vide'));
      }
      emit(CollectiveTrainingSessionStateLoaded(sessions: filteredSessions));
    } on Exception {
      emit(CollectiveTrainingSessionStateError(message: 'Other error'));
    }
  }
}


/*
on<CollectiveTrainingSessionRequestedEvent>((event, emit) async {
      emit(CollectiveTrainingSessionStateLoading());
      try {
        final sessions =
            await readAllCollectiveTrainingSession.call(NoParams());

        if (sessions.isLeft) {
          emit(CollectiveTrainingSessionStateError(message: 'Not found'));
        } else {
          emit(CollectiveTrainingSessionStateLoaded(sessions: sessions.right));
        }
      } on Exception {
        emit(CollectiveTrainingSessionStateError(message: 'Other error'));
      }
    }
*/ 