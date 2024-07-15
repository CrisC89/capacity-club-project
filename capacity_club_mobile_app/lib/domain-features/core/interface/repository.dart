import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:either_dart/either.dart';

abstract class Repository<MODEL, CREATE_PAYLOAD, UPDATE_PAYLOAD, FILTER, ID> {
  Future<Either<Failure, ApiResponse<List<MODEL>>>> getAll();
  Future<Either<Failure, ApiResponse<List<MODEL>>>> filter(FILTER filter);
  Future<Either<Failure, ApiResponse<MODEL>>> detail(ID uniqueId);
  Future<Either<Failure, ApiResponse<MODEL>>> update(UPDATE_PAYLOAD payload);
  Future<Either<Failure, ApiResponse<MODEL>>> create(CREATE_PAYLOAD payload);
  Future<Either<Failure, ApiResponse<void>>> delete(ID uniqueId);
}
