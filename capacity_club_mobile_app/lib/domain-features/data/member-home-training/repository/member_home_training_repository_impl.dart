import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/datasource/member_home_training_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/filter/member_home_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/member_home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/payload/member_home_training_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/payload/member_home_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-home-training/failure/member_home_training_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class MemberHomeTrainingRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<MemberHomeTrainingModel, MemberHomeTrainingCreatePayload,
            MemberHomeTrainingUpdatePayload, MemberHomeTrainingFilter, String> {
  final MemberHomeTrainingDatasource memberHomeTrainingDatasource;
  final Logger _logger = Logger('MemberHomeTrainingRepositoryImpl');

  MemberHomeTrainingRepositoryImpl(
      {required this.memberHomeTrainingDatasource});

  @override
  Future<Either<Failure, ApiResponse<MemberHomeTrainingModel>>> detail(
      String uniqueId) async {
    _logger.info('Fetching detail for MemberHomeTraining with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberHomeTrainingDatasource.detail(uniqueId),
      MemberHomeTrainingNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberHomeTrainingModel>>>> filter(
      MemberHomeTrainingFilter filter) async {
    _logger
        .info('Filtering MemberHomeTrainings with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => memberHomeTrainingDatasource.filter(filter),
      MemberHomeTrainingFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberHomeTrainingModel>>> update(
      MemberHomeTrainingUpdatePayload payload) async {
    _logger.info('Updating MemberHomeTraining with payload: $payload');
    return repositoryHandleRequest(
      () => memberHomeTrainingDatasource.update(payload),
      MemberHomeTrainingUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberHomeTrainingModel>>> create(
      MemberHomeTrainingCreatePayload payload) async {
    _logger.info('Creating MemberHomeTraining with payload: $payload');
    return repositoryHandleRequest(
      () => memberHomeTrainingDatasource.create(payload),
      MemberHomeTrainingCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting MemberHomeTraining with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberHomeTrainingDatasource.delete(uniqueId),
      MemberHomeTrainingDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberHomeTrainingModel>>>>
      getAll() async {
    _logger.info('Fetching all MemberHomeTrainings');
    return repositoryHandleRequest(
      () => memberHomeTrainingDatasource.getAll(),
      MemberHomeTrainingListFailure(),
    );
  }
}
