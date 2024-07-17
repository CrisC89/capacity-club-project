import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/datasource/member_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/filter/member_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/payload/member_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/payload/member_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/failure/member_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class MemberRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<MemberModel, MemberCreatePayload, MemberUpdatePayload,
            MemberFilter, String> {
  final MemberDatasource memberDatasource;
  final Logger _logger = Logger('MemberRepositoryImpl');

  MemberRepositoryImpl({required this.memberDatasource});

  @override
  Future<Either<Failure, ApiResponse<MemberModel>>> detail(
      String uniqueId) async {
    _logger.info('Fetching detail for Member with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberDatasource.detail(uniqueId),
      MemberNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberModel>>>> filter(
      MemberFilter filter) async {
    _logger.info('Filtering Members with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => memberDatasource.filter(filter),
      MemberFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberModel>>> update(
      MemberUpdatePayload payload) async {
    _logger.info('Updating Member with payload: $payload');
    return repositoryHandleRequest(
      () => memberDatasource.update(payload),
      MemberUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberModel>>> create(
      MemberCreatePayload payload) async {
    _logger.info('Creating Member with payload: $payload');
    return repositoryHandleRequest(
      () => memberDatasource.create(payload),
      MemberCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting Member with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberDatasource.delete(uniqueId),
      MemberDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberModel>>>> getAll() async {
    _logger.info('Fetching all Members');
    return repositoryHandleRequest(
      () => memberDatasource.getAll(),
      MemberListFailure(),
    );
  }
}
