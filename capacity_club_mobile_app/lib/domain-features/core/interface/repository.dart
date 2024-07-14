import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:either_dart/either.dart';

abstract class Repository<MODEL, CREATE_PAYLOAD, UPDATE_PAYLOAD, FILTER, ID> {
  Future<Either<ApiResponse<List<MODEL>>, Failure>> getAll();
  Future<Either<ApiResponse<List<MODEL>>, Failure>> filter(FILTER filter);
  Future<Either<ApiResponse<MODEL>, Failure>> detail(ID uniqueId);
  Future<Either<ApiResponse<MODEL>, Failure>> update(UPDATE_PAYLOAD payload);
  Future<Either<ApiResponse<MODEL>, Failure>> create(CREATE_PAYLOAD payload);
  Future<Either<void, Failure>> delete(ID uniqueId);
}
