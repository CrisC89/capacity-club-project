part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterByUsernameState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccesState extends RegisterState {}

final class RegisterFailureState extends RegisterState {}
