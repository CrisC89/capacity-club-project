part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class OnDateChangedHomeEvent extends HomeEvent {}
