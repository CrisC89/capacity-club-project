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

  CollectiveTrainingSessionBloc(
      {required this.readAllCollectiveTrainingSession})
      : super(CollectiveTrainingSessionStateLoading()) {
    on<CollectiveTrainingSessionEvent>((event, emit) async {
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
    });
  }
}
