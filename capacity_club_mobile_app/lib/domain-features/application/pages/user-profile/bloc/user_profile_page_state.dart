part of 'user_profile_page_bloc.dart';

@immutable
sealed class UserProfilePageState extends Equatable {
  const UserProfilePageState();
  @override
  List<Object?> get props => [];
}

final class UserProfilePageInitial extends UserProfilePageState {}

final class UserProfilePageLoadedState extends UserProfilePageState {}

final class UserProfilePageLoadingState extends UserProfilePageState {}

final class UserProfilePageErrorState extends UserProfilePageState {}
