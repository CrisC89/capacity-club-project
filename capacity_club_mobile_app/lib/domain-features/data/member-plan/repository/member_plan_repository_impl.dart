import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/datasource/member_plan_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/filter/member_plan_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/member_plan_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/payload/member_plan_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/payload/member_plan_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-plan/failure/member_plan_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class MemberPlanRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<MemberPlanModel, MemberPlanCreatePayload,
            MemberPlanUpdatePayload, MemberPlanFilter, String> {
  final MemberPlanDatasource memberPlanDatasource;
  final Logger _logger = Logger('MemberPlanRepositoryImpl');

  MemberPlanRepositoryImpl({required this.memberPlanDatasource});

  @override
  Future<Either<Failure, ApiResponse<MemberPlanModel>>> detail(
      String uniqueId) async {
    _logger.info('Fetching detail for MemberPlan with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberPlanDatasource.detail(uniqueId),
      MemberPlanNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberPlanModel>>>> filter(
      MemberPlanFilter filter) async {
    _logger.info('Filtering MemberPlans with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => memberPlanDatasource.filter(filter),
      MemberPlanFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberPlanModel>>> update(
      MemberPlanUpdatePayload payload) async {
    _logger.info('Updating MemberPlan with payload: $payload');
    return repositoryHandleRequest(
      () => memberPlanDatasource.update(payload),
      MemberPlanUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberPlanModel>>> create(
      MemberPlanCreatePayload payload) async {
    _logger.info('Creating MemberPlan with payload: $payload');
    return repositoryHandleRequest(
      () => memberPlanDatasource.create(payload),
      MemberPlanCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting MemberPlan with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberPlanDatasource.delete(uniqueId),
      MemberPlanDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberPlanModel>>>> getAll() async {
    _logger.info('Fetching all MemberPlans');
    return repositoryHandleRequest(
      () => memberPlanDatasource.getAll(),
      MemberPlanListFailure(),
    );
  }
}
