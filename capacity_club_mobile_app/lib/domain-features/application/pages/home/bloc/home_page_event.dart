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
  @override
  List<Object?> get props => [currentDate];
}

final class HomePageDateChangedEvent extends HomePageEvent {
  final DateTime selectedDate;
  HomePageDateChangedEvent({required this.selectedDate});
  @override
  List<Object?> get props => [selectedDate];
}
