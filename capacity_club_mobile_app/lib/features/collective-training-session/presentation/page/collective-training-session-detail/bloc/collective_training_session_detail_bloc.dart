import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/core/contract/usecase.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/usecase/collective-training-session-by-id.usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'collective_training_session_detail_event.dart';
part 'collective_training_session_detail_state.dart';

class CollectiveTrainingSessionDetailBloc extends Bloc<
    CollectiveTrainingSessionDetailEvent,
    CollectiveTrainingSessionDetailState> {
  final CollectiveTrainingSessionById collectiveById;
  final String collective_id;
  CollectiveTrainingSessionDetailBloc(
      {required this.collectiveById, required this.collective_id})
      : super(CollectiveTrainingSessionDetailStateLoading()) {
    on<CollectiveTrainingSessionDetailRequestedEvent>((event, emit) async {
      emit(CollectiveTrainingSessionDetailStateLoading());
      try {
        final session = await collectiveById.call(
            CollectiveTrainingSessionIdParam(
                collective_training_session_id: collective_id));

        if (session.isLeft) {
          emit(CollectiveTrainingSessionDetailStateError(message: 'Not found'));
        } else {
          emit(CollectiveTrainingSessionDetailStateLoaded(
              session: session.right));
        }
      } on Exception {
        emit(CollectiveTrainingSessionDetailStateError(message: 'Other error'));
      }
    });
  }
}
