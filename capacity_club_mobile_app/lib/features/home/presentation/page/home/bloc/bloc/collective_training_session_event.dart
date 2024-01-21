part of 'collective_training_session_bloc.dart';

@immutable
sealed class CollectiveTrainingSessionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CollectiveTrainingSessionRequestedEvent
    extends CollectiveTrainingSessionEvent {}
