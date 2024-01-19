part of 'user_bloc.dart';

@immutable
sealed class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UserInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateLoaded extends UserState {
  final Member user;
  UserStateLoaded({required this.user});
  @override
  List<Object?> get props => [user];
}

class UserStateError extends UserState {
  final String message;
  UserStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
