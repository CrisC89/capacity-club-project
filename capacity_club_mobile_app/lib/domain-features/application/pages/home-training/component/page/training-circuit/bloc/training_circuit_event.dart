part of 'training_circuit_bloc.dart';

@immutable
sealed class TrainingCircuitEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTrainingCircuits extends TrainingCircuitEvent {
  //final List<TrainingCircuitEntity> circuits;

  LoadTrainingCircuits();

  //@override
  //List<Object> get props => [circuits];
}

class NextCircuit extends TrainingCircuitEvent {}

class PreviousCircuit extends TrainingCircuitEvent {}
