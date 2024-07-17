import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/datasource/member_plan_subscription_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/filter/member_plan_subscription_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/member_plan_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/payload/member_plan_subscription_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/payload/member_plan_subscription_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-plan-subscription/failure/member_plan_subscription_failure.dart';
import 'package:either_dart/either.dart';
import 'package:logging/logging.dart';

class MemberPlanSubscriptionRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<
            MemberPlanSubscriptionModel,
            MemberPlanSubscriptionCreatePayload,
            MemberPlanSubscriptionUpdatePayload,
            MemberPlanSubscriptionFilter,
            String> {
  final MemberPlanSubscriptionDatasource memberPlanSubscriptionDatasource;
  final Logger _logger = Logger('MemberPlanSubscriptionRepositoryImpl');

  MemberPlanSubscriptionRepositoryImpl(
      {required this.memberPlanSubscriptionDatasource});

  @override
  Future<Either<Failure, ApiResponse<MemberPlanSubscriptionModel>>> detail(
      String uniqueId) async {
    _logger
        .info('Fetching detail for MemberPlanSubscription with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberPlanSubscriptionDatasource.detail(uniqueId),
      MemberPlanSubscriptionNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberPlanSubscriptionModel>>>>
      filter(MemberPlanSubscriptionFilter filter) async {
    _logger.info(
        'Filtering MemberPlanSubscriptions with filter: ${filter.toJson()}');
    return repositoryHandleRequest(
      () => memberPlanSubscriptionDatasource.filter(filter),
      MemberPlanSubscriptionFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberPlanSubscriptionModel>>> update(
      MemberPlanSubscriptionUpdatePayload payload) async {
    _logger.info('Updating MemberPlanSubscription with payload: $payload');
    return repositoryHandleRequest(
      () => memberPlanSubscriptionDatasource.update(payload),
      MemberPlanSubscriptionUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MemberPlanSubscriptionModel>>> create(
      MemberPlanSubscriptionCreatePayload payload) async {
    _logger.info('Creating MemberPlanSubscription with payload: $payload');
    return repositoryHandleRequest(
      () => memberPlanSubscriptionDatasource.create(payload),
      MemberPlanSubscriptionCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    _logger.info('Deleting MemberPlanSubscription with ID: $uniqueId');
    return repositoryHandleRequest(
      () => memberPlanSubscriptionDatasource.delete(uniqueId),
      MemberPlanSubscriptionDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<MemberPlanSubscriptionModel>>>>
      getAll() async {
    _logger.info('Fetching all MemberPlanSubscriptions');
    return repositoryHandleRequest(
      () => memberPlanSubscriptionDatasource.getAll(),
      MemberPlanSubscriptionListFailure(),
    );
  }
}
