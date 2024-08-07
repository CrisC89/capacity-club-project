import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
