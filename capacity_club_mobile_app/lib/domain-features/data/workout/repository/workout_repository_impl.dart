import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/datasource/workout_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/filter/workout_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/payload/workout_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/payload/workout_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/failure/workout_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class WorkoutRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<WorkoutModel, WorkoutCreatePayload, WorkoutUpdatePayload,
            WorkoutFilter, String> {
  final WorkoutDatasource workoutDatasource;
  final Logger _logger = Logger('WorkoutRepositoryImpl');

  WorkoutRepositoryImpl({required this.workoutDatasource});

  @override
  Future<Either<Failure, ApiResponse<WorkoutModel>>> detail(
      String uniqueId) async {
    _logger.info('Fetching detail for Workout with ID: $uniqueId');
    return repositoryHandleRequest(
      () => workoutDatasource.detail(uniqueId),
      WorkoutNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<WorkoutModel>>>> filter(
      WorkoutFilter filter) async {
    _logger.info('Filtering Workouts with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => workoutDatasource.filter(filter),
      WorkoutFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<WorkoutModel>>> update(
      WorkoutUpdatePayload payload) async {
    _logger.info('Updating Workout with payload: $payload');
    return repositoryHandleRequest(
      () => workoutDatasource.update(payload),
      WorkoutUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<WorkoutModel>>> create(
      WorkoutCreatePayload payload) async {
    _logger.info('Creating Workout with payload: $payload');
    return repositoryHandleRequest(
      () => workoutDatasource.create(payload),
      WorkoutCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting Workout with ID: $uniqueId');
    return repositoryHandleRequest(
      () => workoutDatasource.delete(uniqueId),
      WorkoutDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<WorkoutModel>>>> getAll() async {
    _logger.info('Fetching all Workouts');
    return repositoryHandleRequest(
      () => workoutDatasource.getAll(),
      WorkoutListFailure(),
    );
  }
}
