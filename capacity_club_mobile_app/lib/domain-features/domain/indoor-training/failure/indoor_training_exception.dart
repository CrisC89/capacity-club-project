import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';

class IndoorTrainingNotFoundFailure extends Failure {
  IndoorTrainingNotFoundFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class IndoorTrainingListFailure extends Failure {
  IndoorTrainingListFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class IndoorTrainingFilterFailure extends Failure {
  IndoorTrainingFilterFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class IndoorTrainingUpdateFailure extends Failure {
  IndoorTrainingUpdateFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class IndoorTrainingDeleteFailure extends Failure {
  IndoorTrainingDeleteFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class IndoorTrainingCreateFailure extends Failure {
  IndoorTrainingCreateFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}
