part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

final class NavigationInitial extends NavigationState {}

class HomeState extends NavigationState {}

class PersonalTrainingState extends NavigationState {}

class UserProfileState extends NavigationState {}

class SettingState extends NavigationState {}
