part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState extends Equatable {
  const HomePageState();
  @override
  List<Object?> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageLoadedState extends HomePageState {}

final class HomePageLoadingState extends HomePageState {}

final class HomePageErrorState extends HomePageState {}
