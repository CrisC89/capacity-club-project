part of 'training_circuit_bloc.dart';

@immutable
sealed class TrainingCircuitState extends Equatable {
  @override
  List<Object> get props => [];
}

final class TrainingCircuitInitial extends TrainingCircuitState {}

class TrainingCircuitLoaded extends TrainingCircuitState {
  final List<TrainingCircuitEntity> circuits;
  final int currentIndex;

  TrainingCircuitLoaded({required this.circuits, required this.currentIndex});

  TrainingCircuitEntity get currentCircuit => circuits[currentIndex];

  @override
  List<Object> get props => [circuits, currentIndex];
}

final class TrainingCircuitLoading extends TrainingCircuitState {}

class TrainingCircuitError extends TrainingCircuitState {
  final String message;

  TrainingCircuitError({required this.message});

  @override
  List<Object> get props => [message];
}

final class TrainingCircuitEnding extends TrainingCircuitState {}
