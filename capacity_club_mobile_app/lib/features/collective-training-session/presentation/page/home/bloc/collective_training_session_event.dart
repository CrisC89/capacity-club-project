part of 'collective_training_session_bloc.dart';

@immutable
sealed class CollectiveTrainingSessionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CollectiveTrainingSessionRequestedEvent
    extends CollectiveTrainingSessionEvent {}

class CollectiveTrainingSessionFirstRequestedEvent
    extends CollectiveTrainingSessionEvent {}

class CollectiveTrainingSessionChangedDateEvent
    extends CollectiveTrainingSessionEvent {
  final DateTime date;

  CollectiveTrainingSessionChangedDateEvent({required this.date});
}
