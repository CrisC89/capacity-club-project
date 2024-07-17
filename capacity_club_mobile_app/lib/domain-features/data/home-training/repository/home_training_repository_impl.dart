import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/datasource/home_training_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/filter/home_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/payload/home_training_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/payload/home_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/home-training/failure/home_training_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class HomeTrainingRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<HomeTrainingModel, HomeTrainingCreatePayload,
            HomeTrainingUpdatePayload, HomeTrainingFilter, String> {
  final HomeTrainingDatasource homeTrainingDatasource;
  final Logger _logger = Logger('HomeTrainingRepositoryImpl');

  HomeTrainingRepositoryImpl({required this.homeTrainingDatasource});

  @override
  Future<Either<Failure, ApiResponse<HomeTrainingModel>>> detail(
      String uniqueId) async {
    _logger.info('Fetching detail for HomeTraining with ID: $uniqueId');
    return repositoryHandleRequest(
      () => homeTrainingDatasource.detail(uniqueId),
      HomeTrainingNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<HomeTrainingModel>>>> filter(
      HomeTrainingFilter filter) async {
    _logger.info('Filtering HomeTraining with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => homeTrainingDatasource.filter(filter),
      HomeTrainingFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<HomeTrainingModel>>> update(
      HomeTrainingUpdatePayload payload) async {
    _logger.info('Updating HomeTraining with payload: $payload');
    return repositoryHandleRequest(
      () => homeTrainingDatasource.update(payload),
      HomeTrainingUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<HomeTrainingModel>>> create(
      HomeTrainingCreatePayload payload) async {
    _logger.info('Creating HomeTraining with payload: $payload');
    return repositoryHandleRequest(
      () => homeTrainingDatasource.create(payload),
      HomeTrainingCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting HomeTraining with ID: $uniqueId');
    return repositoryHandleRequest(
      () => homeTrainingDatasource.delete(uniqueId),
      HomeTrainingDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<HomeTrainingModel>>>> getAll() async {
    _logger.info('Fetching all HomeTraining');
    return repositoryHandleRequest(
      () => homeTrainingDatasource.getAll(),
      HomeTrainingListFailure(),
    );
  }
}
