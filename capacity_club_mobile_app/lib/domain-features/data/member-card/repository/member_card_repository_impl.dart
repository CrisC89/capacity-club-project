import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/datasource/member_card_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/filter/member_card_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/payload/member_card_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/payload/member_card_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-card/failure/member_card_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class MemberCardRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<MemberCardModel, MemberCardCreatePayload,
            MemberCardUpdatePayload, MemberCardFilter, String> {
  final MemberCardDatasource memberCardDatasource;
  final Logger _logger = Logger('MemberCardRepositoryImpl');

  MemberCardRepositoryImpl({required this.memberCardDatasource});

  @override
  Future<Either<Failure, ApiResponse<MemberCardModel>>> detail(
      String uniqueId) async {
    _logger.info('Fetching detail for MemberCard with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberCardDatasource.detail(uniqueId),
      MemberCardNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberCardModel>>>> filter(
      MemberCardFilter filter) async {
    _logger.info('Filtering MemberCards with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => memberCardDatasource.filter(filter),
      MemberCardFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberCardModel>>> update(
      MemberCardUpdatePayload payload) async {
    _logger.info('Updating MemberCard with payload: $payload');
    return repositoryHandleRequest(
      () => memberCardDatasource.update(payload),
      MemberCardUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberCardModel>>> create(
      MemberCardCreatePayload payload) async {
    _logger.info('Creating MemberCard with payload: $payload');
    return repositoryHandleRequest(
      () => memberCardDatasource.create(payload),
      MemberCardCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting MemberCard with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberCardDatasource.delete(uniqueId),
      MemberCardDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberCardModel>>>> getAll() async {
    _logger.info('Fetching all MemberCards');
    return repositoryHandleRequest(
      () => memberCardDatasource.getAll(),
      MemberCardListFailure(),
    );
  }
}
