part of 'test_bloc.dart';

@immutable
sealed class TestEvent extends Equatable {
  const TestEvent();
  @override
  List<Object?> get props => [];
}

class OnInitTestEvent extends TestEvent {}

class OnDateChangedTestEvent extends TestEvent {}
