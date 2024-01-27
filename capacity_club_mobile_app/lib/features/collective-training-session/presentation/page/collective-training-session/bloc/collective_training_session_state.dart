part of 'collective_training_session_bloc.dart';

@immutable
sealed class CollectiveTrainingSessionState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CollectiveTrainingSessionInitial
    extends CollectiveTrainingSessionState {}

class CollectiveTrainingSessionStateLoading
    extends CollectiveTrainingSessionState {}

class CollectiveTrainingSessionStateLoaded
    extends CollectiveTrainingSessionState {
  final List<CollectiveTrainingSession> sessions;
  CollectiveTrainingSessionStateLoaded({required this.sessions});
  @override
  List<Object?> get props => [sessions];
}

class CollectiveTrainingSessionStateError
    extends CollectiveTrainingSessionState {
  final String message;
  CollectiveTrainingSessionStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
