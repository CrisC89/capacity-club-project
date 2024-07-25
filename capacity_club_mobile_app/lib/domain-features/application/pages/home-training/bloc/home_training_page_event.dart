part of 'home_training_page_bloc.dart';

@immutable
sealed class HomeTrainingPageEvent extends Equatable {
  const HomeTrainingPageEvent();
  @override
  List<Object?> get props => [];
}

final class HomeTrainingPageInitEvent extends HomeTrainingPageEvent {}
