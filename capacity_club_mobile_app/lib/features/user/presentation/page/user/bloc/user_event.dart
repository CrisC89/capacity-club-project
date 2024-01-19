part of 'user_bloc.dart';

@immutable
sealed class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserRequestedEvent extends UserEvent {}
