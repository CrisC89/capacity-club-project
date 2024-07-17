import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/datasource/training_circuit_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/filter/training_circuit_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/payload/training_circuit_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/payload/training_circuit_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/failure/training_circuit_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class TrainingCircuitRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<TrainingCircuitModel, TrainingCircuitCreatePayload,
            TrainingCircuitUpdatePayload, TrainingCircuitFilter, String> {
  final TrainingCircuitDatasource trainingCircuitDatasource;
  final Logger _logger = Logger('TrainingCircuitRepositoryImpl');

  TrainingCircuitRepositoryImpl({required this.trainingCircuitDatasource});

  @override
  Future<Either<Failure, ApiResponse<TrainingCircuitModel>>> detail(
      String uniqueId) async {
    _logger.info('Fetching detail for TrainingCircuit with ID: $uniqueId');
    return repositoryHandleRequest(
      () => trainingCircuitDatasource.detail(uniqueId),
      TrainingCircuitNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<TrainingCircuitModel>>>> filter(
      TrainingCircuitFilter filter) async {
    _logger.info('Filtering TrainingCircuits with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => trainingCircuitDatasource.filter(filter),
      TrainingCircuitFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<TrainingCircuitModel>>> update(
      TrainingCircuitUpdatePayload payload) async {
    _logger.info('Updating TrainingCircuit with payload: $payload');
    return repositoryHandleRequest(
      () => trainingCircuitDatasource.update(payload),
      TrainingCircuitUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<TrainingCircuitModel>>> create(
      TrainingCircuitCreatePayload payload) async {
    _logger.info('Creating TrainingCircuit with payload: $payload');
    return repositoryHandleRequest(
      () => trainingCircuitDatasource.create(payload),
      TrainingCircuitCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting TrainingCircuit with ID: $uniqueId');
    return repositoryHandleRequest(
      () => trainingCircuitDatasource.delete(uniqueId),
      TrainingCircuitDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<TrainingCircuitModel>>>>
      getAll() async {
    _logger.info('Fetching all TrainingCircuits');
    return repositoryHandleRequest(
      () => trainingCircuitDatasource.getAll(),
      TrainingCircuitListFailure(),
    );
  }
}
