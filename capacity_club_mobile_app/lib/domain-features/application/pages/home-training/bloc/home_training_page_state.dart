part of 'home_training_page_bloc.dart';

@immutable
sealed class HomeTrainingPageState extends Equatable {
  const HomeTrainingPageState();
  @override
  List<Object?> get props => [];
}

final class HomeTrainingPageInitial extends HomeTrainingPageState {}

final class HomeTrainingPageLoadedState extends HomeTrainingPageState {}

final class HomeTrainingPageLoadingState extends HomeTrainingPageState {}

final class HomeTrainingPageErrorState extends HomeTrainingPageState {}
