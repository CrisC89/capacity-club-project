part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterByMailEvent extends RegisterEvent {}

class RegisterByGoogleEvent extends RegisterEvent {}

class RegisterByFacebookEvent extends RegisterEvent {}
