part of 'auth_flow_bloc.dart';

@immutable
sealed class AuthFlowEvent {}

class AuthFlowStartedEvent extends AuthFlowEvent {}
