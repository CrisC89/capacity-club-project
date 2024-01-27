part of 'collective_training_session_detail_bloc.dart';

@immutable
sealed class CollectiveTrainingSessionDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CollectiveTrainingSessionDetailInitial
    extends CollectiveTrainingSessionDetailState {}

class CollectiveTrainingSessionDetailStateLoading
    extends CollectiveTrainingSessionDetailState {}

class CollectiveTrainingSessionDetailStateLoaded
    extends CollectiveTrainingSessionDetailState {
  final CollectiveTrainingSession session;
  CollectiveTrainingSessionDetailStateLoaded({required this.session});
  @override
  List<Object?> get props => [session];
}

class CollectiveTrainingSessionDetailStateError
    extends CollectiveTrainingSessionDetailState {
  final String message;
  CollectiveTrainingSessionDetailStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
