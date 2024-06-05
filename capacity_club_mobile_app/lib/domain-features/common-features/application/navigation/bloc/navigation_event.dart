part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToHomePage extends NavigationEvent {}

class NavigateToPersonalTrainingPage extends NavigationEvent {}

class NavigateToUserProfilePage extends NavigationEvent {}

class NavigateToSettingPage extends NavigationEvent {}
