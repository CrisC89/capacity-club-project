part of 'login_bloc.dart';

enum LoginStatus { initial, loading, succes, error }

@immutable
sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoginGenericState extends LoginState {
  final String email;
  final String password;
  final String message;
  final LoginStatus status;
  LoginGenericState(
      {required this.email,
      required this.password,
      required this.message,
      required this.status});

  LoginGenericState copyWith(
      {String? email, String? password, String? message, LoginStatus? status}) {
    return LoginGenericState(
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? this.message,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [email, password, message, status];
}

final class LoginByMailState extends LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSucces extends LoginState {}

final class LoginFailure2 extends LoginState {}
