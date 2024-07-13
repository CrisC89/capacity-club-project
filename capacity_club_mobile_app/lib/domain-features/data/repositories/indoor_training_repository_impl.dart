import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/failure/common_failure.dart';
import 'package:capacity_club_mobile_app/domain-features/data/datasources/impls/indoor_training_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/models/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/models/indoor_training.dart';
import 'package:capacity_club_mobile_app/domain-features/data/models/payload/indoor_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/failures/indoor_training_exception.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/repositories/indoor_training_repository.dart';
import 'package:either_dart/src/either.dart';

class IndoorTrainingRepositoryImpl implements IndoorTrainingRepository {
  final IndoorTrainingDataSource indoorTrainingDataSource;

  IndoorTrainingRepositoryImpl({required this.indoorTrainingDataSource});
  @override
  Future<Either<ApiResponse<IndoorTrainingModel>, Failure>> detail(
      String unique_id) async {
    try {
      final response = await indoorTrainingDataSource.detail(unique_id);
      if (response.result) {
        return Future.value(Left(response));
      } else {
        return Future.value(Right(IndoorTrainingNotFoundFailure()));
      }
    } on ServerException catch (e) {
      return Future.value(Right(ServerFailure()));
    } on GenericException catch (e) {
      return Future.value(Right(GenericFailure()));
    }
  }

  @override
  Future<Either<ApiResponse<List<IndoorTrainingModel>>, Failure>> filter(
      IndoorTrainingFilter filter) async {
    try {
      final response = await indoorTrainingDataSource.filter(filter);
      if (response.result) {
        return Future.value(Left(response));
      } else {
        return Future.value(Right(IndoorTrainingListFailure()));
      }
    } on ServerException catch (e) {
      return Future.value(Right(ServerFailure()));
    } on GenericException catch (e) {
      return Future.value(Right(GenericFailure()));
    }
  }

  @override
  Future<Either<ApiResponse<IndoorTrainingModel>, Failure>> update(
      IndoorTrainingUpdatePayload payload) async {
    try {
      final response = await indoorTrainingDataSource.update(payload);
      if (response.result) {
        return Future.value(Left(response));
      } else {
        return Future.value(Right(IndoorTrainingUpdateFailure()));
      }
    } on ServerException catch (e) {
      return Future.value(Right(ServerFailure()));
    } on GenericException catch (e) {
      return Future.value(Right(GenericFailure()));
    }
  }
}
