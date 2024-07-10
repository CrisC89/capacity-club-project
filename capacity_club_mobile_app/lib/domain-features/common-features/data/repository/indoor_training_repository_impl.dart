import 'package:capacity_club_mobile_app/common/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/common/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/datasource/indoor_training_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/indoor_training.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/payload/indoor_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/domain/failure/indoor_training_exception.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/domain/repository/indoor_training_repository.dart';
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
