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
  Future<Either<Failure, ApiResponse<IndoorTrainingModel>>> detail(
      String unique_id) async {
    try {
      final response = await indoorTrainingDataSource.detail(unique_id);
      if (response.result) {
        return Right(response);
      } else {
        return Left(IndoorTrainingNotFoundFailure());
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    } catch (e) {
      return Left(GenericFailure(stackTrace: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<IndoorTrainingModel>>>> filter(
      IndoorTrainingFilter filter) async {
    try {
      final response = await indoorTrainingDataSource.filter(filter);
      if (response.result) {
        return Right(response);
      } else {
        return Left(IndoorTrainingListFailure());
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    } catch (e) {
      return Left(GenericFailure(stackTrace: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<IndoorTrainingModel>>> update(
      IndoorTrainingUpdatePayload payload) async {
    try {
      final response = await indoorTrainingDataSource.update(payload);
      if (response.result) {
        return Right(response);
      } else {
        return Left(IndoorTrainingUpdateFailure());
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    } catch (e) {
      return Left(GenericFailure(stackTrace: e.toString()));
    }
  }
}
