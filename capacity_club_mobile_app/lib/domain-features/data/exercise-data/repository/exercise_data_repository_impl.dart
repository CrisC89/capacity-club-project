import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/datasource/excercise_data_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/exercise_data_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/filter/exercise_data_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/payload/exercise_data_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/payload/exercise_data_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-data/failure/exercise_data_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class ExerciseDataRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<ExerciseDataModel, ExerciseDataCreatePayload,
            ExerciseDataUpdatePayload, ExerciseDataFilter, String> {
  final ExerciseDataDatasource exerciseDataSource;
  final Logger _logger = Logger('ExerciseDataRepositoryImpl');

  ExerciseDataRepositoryImpl({required this.exerciseDataSource});

  @override
  Future<Either<Failure, ApiResponse<ExerciseDataModel>>> detail(
      String uniqueId) async {
    _logger.info('Fetching detail for ExerciseData with ID: $uniqueId');
    return repositoryHandleRequest(
      () => exerciseDataSource.detail(uniqueId),
      ExerciseDataNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<ExerciseDataModel>>>> filter(
      ExerciseDataFilter filter) async {
    _logger.info('Filtering ExerciseData with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => exerciseDataSource.filter(filter),
      ExerciseDataFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<ExerciseDataModel>>> update(
      ExerciseDataUpdatePayload payload) async {
    _logger.info('Updating ExerciseData with payload: $payload');
    return repositoryHandleRequest(
      () => exerciseDataSource.update(payload),
      ExerciseDataUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<ExerciseDataModel>>> create(
      ExerciseDataCreatePayload payload) async {
    _logger.info('Creating ExerciseData with payload: $payload');
    return repositoryHandleRequest(
      () => exerciseDataSource.create(payload),
      ExerciseDataCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting ExerciseData with ID: $uniqueId');
    return repositoryHandleRequest(
      () => exerciseDataSource.delete(uniqueId),
      ExerciseDataDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<ExerciseDataModel>>>> getAll() async {
    _logger.info('Fetching all ExerciseData');
    return repositoryHandleRequest(
      () => exerciseDataSource.getAll(),
      ExerciseDataListFailure(),
    );
  }
}
