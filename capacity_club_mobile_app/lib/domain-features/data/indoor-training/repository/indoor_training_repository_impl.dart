import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/failure/common_failure.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/datasource/indoor_training_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/payload/indoor_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/failure/indoor_training_exception.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/repository/indoor_training_repository.dart';
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
      return Future.value(Right(ServerFailure(stackTrace: e.toString())));
    } on GenericException catch (e) {
      return Future.value(Right(GenericFailure(stackTrace: e.toString())));
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
      return Future.value(Right(ServerFailure(stackTrace: e.toString())));
    } on GenericException catch (e) {
      return Future.value(Right(GenericFailure(stackTrace: e.toString())));
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
      return Future.value(Right(ServerFailure(stackTrace: e.toString())));
    } on GenericException catch (e) {
      return Future.value(Right(GenericFailure(stackTrace: e.toString())));
    }
  }
}
