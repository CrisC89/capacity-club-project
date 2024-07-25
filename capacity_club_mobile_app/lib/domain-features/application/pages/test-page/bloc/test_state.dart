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
  final List<Map<String, dynamic>> collectiveIndoorTrainingList;
  final List<Map<String, dynamic>> individualIndoorTrainingList;

  const TestLoadedState(
      {required this.collectiveIndoorTrainingList,
      required this.individualIndoorTrainingList});

  @override
  List<Object?> get props =>
      [collectiveIndoorTrainingList, individualIndoorTrainingList];
}

final class TestErrorState extends TestState {}

final class OnNewDateLoadingTestState extends TestState {}

final class OnNewDateLoadedTestState extends TestState {}
