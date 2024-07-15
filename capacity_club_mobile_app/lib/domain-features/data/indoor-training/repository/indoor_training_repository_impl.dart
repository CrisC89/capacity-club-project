import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/failure/common_failure.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/datasource/indoor_training_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/payload/indoor_training_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/payload/indoor_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/failure/indoor_training_exception.dart';
import 'package:either_dart/src/either.dart';

class IndoorTrainingRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<IndoorTrainingModel, IndoorTrainingCreatePayload,
            IndoorTrainingUpdatePayload, IndoorTrainingFilter, String> {
  final IndoorTrainingDataSource indoorTrainingDataSource;

  IndoorTrainingRepositoryImpl({required this.indoorTrainingDataSource});

  @override
  Future<Either<Failure, ApiResponse<IndoorTrainingModel>>> detail(
      String uniqueId) async {
    return repositoryHandleRequest(
      () => indoorTrainingDataSource.detail(uniqueId),
      IndoorTrainingNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<IndoorTrainingModel>>>> filter(
      IndoorTrainingFilter filter) async {
    return repositoryHandleRequest(
      () => indoorTrainingDataSource.filter(filter),
      IndoorTrainingFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<IndoorTrainingModel>>> update(
      IndoorTrainingUpdatePayload payload) async {
    return repositoryHandleRequest(
      () => indoorTrainingDataSource.update(payload),
      IndoorTrainingUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<IndoorTrainingModel>>> create(
      IndoorTrainingCreatePayload payload) async {
    return repositoryHandleRequest(
      () => indoorTrainingDataSource.create(payload),
      IndoorTrainingCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    return repositoryHandleRequest(
      () => indoorTrainingDataSource.delete(uniqueId),
      IndoorTrainingDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<IndoorTrainingModel>>>>
      getAll() async {
    return repositoryHandleRequest(
      () => indoorTrainingDataSource.getAll(),
      IndoorTrainingListFailure(),
    );
  }
}
