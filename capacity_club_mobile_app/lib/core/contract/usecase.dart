import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

abstract class Params extends Equatable {}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
