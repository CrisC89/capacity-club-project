part of 'auth_flow_bloc.dart';

@immutable
sealed class AuthFlowState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthFlowInitial extends AuthFlowState {}

class AuthFlowLoading extends AuthFlowState {}

class AuthFlowSuccess extends AuthFlowState {
  final GoRouter router;
  AuthFlowSuccess({required this.router});

  @override
  List<Object?> get props => [router];
}

class AuthFlowFailure extends AuthFlowState {
  final GoRouter router;
  AuthFlowFailure({required this.router});

  @override
  List<Object?> get props => [router];
}
