part of 'test_bloc.dart';

@immutable
sealed class TestState extends Equatable {
  const TestState();
  @override
  List<Object?> get props => [];
}

final class TestInitial extends TestState {}

final class TestLoadingState extends TestState {}

final class TestLoadedState extends TestState {
  final List<Map<String, dynamic>> indoorTrainingList;

  const TestLoadedState({required this.indoorTrainingList});

  @override
  List<Object?> get props => [indoorTrainingList];
}

final class TestErrorState extends TestState {}

final class OnNewDateLoadingTestState extends TestState {}

final class OnNewDateLoadedTestState extends TestState {}
