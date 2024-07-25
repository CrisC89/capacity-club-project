part of 'user_profile_page_bloc.dart';

@immutable
sealed class UserProfilePageEvent extends Equatable {
  const UserProfilePageEvent();
  @override
  List<Object?> get props => [];
}

final class UserProfilePageInitEvent extends UserProfilePageEvent {}
