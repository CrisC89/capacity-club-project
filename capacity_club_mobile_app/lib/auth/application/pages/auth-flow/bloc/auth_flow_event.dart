part of 'auth_flow_bloc.dart';

@immutable
sealed class AuthFlowEvent {}

class AuthFlowStartedEvent extends AuthFlowEvent {}

class AuthFlowCheckUserEvent extends AuthFlowEvent {}

class AuthFlowCheckStateEvent extends AuthFlowEvent {}
