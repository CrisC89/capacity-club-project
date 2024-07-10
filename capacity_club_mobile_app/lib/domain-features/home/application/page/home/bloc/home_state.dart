part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class OnNewDateLoadingHomeState extends HomeState {}

final class OnNewDateLoadedHomeState extends HomeState {}
