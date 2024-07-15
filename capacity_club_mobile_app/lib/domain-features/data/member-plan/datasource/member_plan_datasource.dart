import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/filter/member_plan_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/member_plan_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/payload/member_plan_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/payload/member_plan_update_payload.dart';
import 'package:logging/logging.dart';

class MemberPlanDatasource extends DataSource<
    MemberPlanModel,
    MemberPlanCreatePayload,
    MemberPlanUpdatePayload,
    MemberPlanFilter,
    String> {
  final DioClient dioClient;
  final Logger _logger = Logger('MemberPlanDatasource');

  MemberPlanDatasource({required this.dioClient});

  @override
  Future<ApiResponse<MemberPlanModel>> create(
      MemberPlanCreatePayload payload) async {
    try {
      _logger.info('Creating member plan with payload: $payload');
      ApiResponse<MemberPlanModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('MEMBER_PLAN', 'CREATE')}',
          payload,
          (json) => MemberPlanModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create member plan with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating member plan with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<void>> delete(String uniqueId) async {
    try {
      _logger.info('Deleting member plan with ID: $uniqueId');
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('MEMBER_PLAN', 'DELETE')}/$uniqueId',
          (json) => MemberPlanModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete member plan with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
      _logger.info('Successfully deleted indoor training with ID: $uniqueId');
      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error deleting member plan with ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberPlanModel>> detail(String uniqueId) async {
    try {
      _logger.info('Fetching detail for member plan ID: $uniqueId');
      ApiResponse<MemberPlanModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_PLAN', 'DETAIL')}/$uniqueId',
          null,
          (json) => MemberPlanModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for member plan ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error fetching detail for member plan ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberPlanModel>>> filter(
      MemberPlanFilter filter) async {
    try {
      _logger.info('Filtering member plans with filter: ${filter.toJson()}');
      ApiResponse<List<MemberPlanModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_PLAN', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => MemberPlanModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter member plans with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error filtering member plans with filter: ${filter.toJson()}',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberPlanModel>>> getAll() async {
    try {
      _logger.info('Fetching all member plans');
      ApiResponse<List<MemberPlanModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_PLAN', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => MemberPlanModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all member plans with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all member plans', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberPlanModel>> update(
      MemberPlanUpdatePayload payload) async {
    try {
      _logger.info('Updating member plan with payload: $payload');
      ApiResponse<MemberPlanModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('MEMBER_PLAN', 'UPDATE')}',
          payload,
          (json) => MemberPlanModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update member plan with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating member plan with payload: $payload', e, stackTrace);
      rethrow;
    }
  }
}
