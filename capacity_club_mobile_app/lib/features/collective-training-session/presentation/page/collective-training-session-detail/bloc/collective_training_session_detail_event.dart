part of 'collective_training_session_detail_bloc.dart';

sealed class CollectiveTrainingSessionDetailEvent extends Equatable {
  const CollectiveTrainingSessionDetailEvent();

  @override
  List<Object> get props => [];
}

class CollectiveTrainingSessionDetailRequestedEvent
    extends CollectiveTrainingSessionDetailEvent {
  final String collective_id;
  const CollectiveTrainingSessionDetailRequestedEvent(
      {required this.collective_id});

  @override
  List<Object> get props => [collective_id];
}
