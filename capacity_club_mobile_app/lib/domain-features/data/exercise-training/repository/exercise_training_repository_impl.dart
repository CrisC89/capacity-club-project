import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/datasource/exercise_training_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/exercise_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/filter/exercise_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/payload/exercise_training_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/payload/exercise_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-training/exercise-data/failure/exercie_training_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class ExerciseTrainingRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<ExerciseTrainingModel, ExerciseTrainingCreatePayload,
            ExerciseTrainingUpdatePayload, ExerciseTrainingFilter, String> {
  final ExerciseTrainingDatasource exerciseTrainingDatasource;
  final Logger _logger = Logger('ExerciseTrainingRepositoryImpl');

  ExerciseTrainingRepositoryImpl({required this.exerciseTrainingDatasource});

  @override
  Future<Either<Failure, ApiResponse<ExerciseTrainingModel>>> detail(
      String uniqueId) async {
    _logger.info('Fetching detail for ExerciseTraining with ID: $uniqueId');
    return repositoryHandleRequest(
      () => exerciseTrainingDatasource.detail(uniqueId),
      ExerciseTrainingNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<ExerciseTrainingModel>>>> filter(
      ExerciseTrainingFilter filter) async {
    _logger.info('Filtering ExerciseTraining with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => exerciseTrainingDatasource.filter(filter),
      ExerciseTrainingFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<ExerciseTrainingModel>>> update(
      ExerciseTrainingUpdatePayload payload) async {
    _logger.info('Updating ExerciseTraining with payload: $payload');
    return repositoryHandleRequest(
      () => exerciseTrainingDatasource.update(payload),
      ExerciseTrainingUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<ExerciseTrainingModel>>> create(
      ExerciseTrainingCreatePayload payload) async {
    _logger.info('Creating ExerciseTraining with payload: $payload');
    return repositoryHandleRequest(
      () => exerciseTrainingDatasource.create(payload),
      ExerciseTrainingCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting ExerciseTraining with ID: $uniqueId');
    return repositoryHandleRequest(
      () => exerciseTrainingDatasource.delete(uniqueId),
      ExerciseTrainingDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<ExerciseTrainingModel>>>>
      getAll() async {
    _logger.info('Fetching all ExerciseTraining');
    return repositoryHandleRequest(
      () => exerciseTrainingDatasource.getAll(),
      ExerciseTrainingListFailure(),
    );
  }
}
