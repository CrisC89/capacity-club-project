part of 'auth_flow_bloc.dart';

@immutable
sealed class AuthFlowState {}

final class AuthFlowInitial extends AuthFlowState {}

class AuthFlowSuccess extends AuthFlowState {}

class AuthFlowFailure extends AuthFlowState {}
