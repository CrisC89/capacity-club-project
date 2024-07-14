import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class GenericFailure extends Failure {
  GenericFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}
