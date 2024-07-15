import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/filter/member_plan_subscription_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/member_plan_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/payload/member_plan_subscription_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan-subscription/model/payload/member_plan_subscription_update_payload.dart';
import 'package:logging/logging.dart';

class MemberPlanSubscriptionDatasource extends DataSource<
    MemberPlanSubscriptionModel,
    MemberPlanSubscriptionCreatePayload,
    MemberPlanSubscriptionUpdatePayload,
    MemberPlanSubscriptionFilter,
    String> {
  final DioClient dioClient;
  final Logger _logger = Logger('MemberPlanSubscriptionDatasource');

  MemberPlanSubscriptionDatasource({required this.dioClient});

  @override
  Future<ApiResponse<MemberPlanSubscriptionModel>> create(
      MemberPlanSubscriptionCreatePayload payload) async {
    try {
      _logger.info('Creating member plan subscription with payload: $payload');
      ApiResponse<MemberPlanSubscriptionModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('MEMBER_PLAN_SUBSCRIPTION', 'CREATE')}',
          payload,
          (json) => MemberPlanSubscriptionModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create member plan subscription with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating member plan subscription with payload: $payload',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<void>> delete(String uniqueId) async {
    try {
      _logger.info('Deleting member plan subscription with ID: $uniqueId');
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('MEMBER_PLAN_SUBSCRIPTION', 'DELETE')}/$uniqueId',
          (json) => MemberPlanSubscriptionModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete member plan subscription with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
      _logger.info('Successfully deleted indoor training with ID: $uniqueId');
      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error deleting member plan subscription with ID: $uniqueId',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberPlanSubscriptionModel>> detail(
      String uniqueId) async {
    try {
      _logger
          .info('Fetching detail for member plan subscription ID: $uniqueId');
      ApiResponse<MemberPlanSubscriptionModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_PLAN_SUBSCRIPTION', 'DETAIL')}/$uniqueId',
          null,
          (json) => MemberPlanSubscriptionModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for member plan subscription ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error fetching detail for member plan subscription ID: $uniqueId',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberPlanSubscriptionModel>>> filter(
      MemberPlanSubscriptionFilter filter) async {
    try {
      _logger.info(
          'Filtering member plan subscriptions with filter: ${filter.toJson()}');
      ApiResponse<List<MemberPlanSubscriptionModel>> response =
          await dioClient.get(
              '${ApiURI.getEndpoint('MEMBER_PLAN_SUBSCRIPTION', 'FILTER')}',
              filter.toJson(),
              (json) => (json as List)
                  .map((item) => MemberPlanSubscriptionModel.fromJson(item))
                  .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter member plan subscriptions with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error filtering member plan subscriptions with filter: ${filter.toJson()}',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberPlanSubscriptionModel>>> getAll() async {
    try {
      _logger.info('Fetching all member plan subscriptions');
      ApiResponse<List<MemberPlanSubscriptionModel>> response =
          await dioClient.get(
              '${ApiURI.getEndpoint('MEMBER_PLAN_SUBSCRIPTION', 'LIST')}',
              null,
              (json) => (json as List)
                  .map((item) => MemberPlanSubscriptionModel.fromJson(item))
                  .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all member plan subscriptions with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error fetching all member plan subscriptions', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberPlanSubscriptionModel>> update(
      MemberPlanSubscriptionUpdatePayload payload) async {
    try {
      _logger.info('Updating member plan subscription with payload: $payload');
      ApiResponse<MemberPlanSubscriptionModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('MEMBER_PLAN_SUBSCRIPTION', 'UPDATE')}',
          payload,
          (json) => MemberPlanSubscriptionModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update member plan subscription with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating member plan subscription with payload: $payload',
          e,
          stackTrace);
      rethrow;
    }
  }
}
