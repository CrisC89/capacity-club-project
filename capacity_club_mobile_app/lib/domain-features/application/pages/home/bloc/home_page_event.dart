part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object?> get props => [];
}

final class HomePageInitEvent extends HomePageEvent {
  HomePageInitEvent();
  final DateTime currentDate = DateTime.now();
  final String currentDateToString = DateTime.now().toIso8601String();
}

final class HomePageDateChangeEvent extends HomePageEvent {}
