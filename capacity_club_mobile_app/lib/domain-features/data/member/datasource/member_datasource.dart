import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/filter/member_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/payload/member_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/payload/member_update_payload.dart';
import 'package:logging/logging.dart';

class MemberDatasource extends DataSource<MemberModel, MemberCreatePayload,
    MemberUpdatePayload, MemberFilter, String> {
  final DioClient dioClient;
  final Logger _logger = Logger('MemberDatasource');

  MemberDatasource({required this.dioClient});

  @override
  Future<ApiResponse<MemberModel>> create(MemberCreatePayload payload) async {
    try {
      ApiResponse<MemberModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('MEMBER', 'CREATE')}',
          payload,
          (json) => MemberModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create member with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating member with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> delete(String uniqueId) async {
    try {
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('MEMBER', 'DELETE')}/$uniqueId',
          (json) => MemberModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete member with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
    } catch (e, stackTrace) {
      _logger.severe('Error deleting member with ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberModel>> detail(String uniqueId) async {
    try {
      ApiResponse<MemberModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER', 'DETAIL')}/$uniqueId',
          null,
          (json) => MemberModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for member ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error fetching detail for member ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberModel>>> filter(MemberFilter filter) async {
    try {
      ApiResponse<List<MemberModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => MemberModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter members with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error filtering members with filter: ${filter.toJson()}',
          e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberModel>>> getAll() async {
    try {
      ApiResponse<List<MemberModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => MemberModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all members with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all members', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberModel>> update(MemberUpdatePayload payload) async {
    try {
      ApiResponse<MemberModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('MEMBER', 'UPDATE')}',
          payload,
          (json) => MemberModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update member with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating member with payload: $payload', e, stackTrace);
      rethrow;
    }
  }
}
