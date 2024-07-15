import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/filter/member_card_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/member_card_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/payload/member_card_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/payload/member_card_update_payload.dart';
import 'package:logging/logging.dart';

class MemberCardDatasource extends DataSource<
    MemberCardModel,
    MemberCardCreatePayload,
    MemberCardUpdatePayload,
    MemberCardFilter,
    String> {
  final DioClient dioClient;
  final Logger _logger = Logger('MemberCardDatasource');

  MemberCardDatasource({required this.dioClient});

  @override
  Future<ApiResponse<MemberCardModel>> create(
      MemberCardCreatePayload payload) async {
    try {
      _logger.info('Creating member card with payload: $payload');
      ApiResponse<MemberCardModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('MEMBER_CARD', 'CREATE')}',
          payload,
          (json) => MemberCardModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create member card with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating member card with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<void>> delete(String uniqueId) async {
    try {
      _logger.info('Deleting member card with ID: $uniqueId');
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('MEMBER_CARD', 'DELETE')}/$uniqueId',
          (json) => MemberCardModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete member card with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
      _logger.info('Successfully deleted indoor training with ID: $uniqueId');
      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error deleting member card with ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberCardModel>> detail(String uniqueId) async {
    try {
      _logger.info('Fetching detail for member card ID: $uniqueId');
      ApiResponse<MemberCardModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_CARD', 'DETAIL')}/$uniqueId',
          null,
          (json) => MemberCardModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for member card ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error fetching detail for member card ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberCardModel>>> filter(
      MemberCardFilter filter) async {
    try {
      _logger.info('Filtering member cards with filter: ${filter.toJson()}');
      ApiResponse<List<MemberCardModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_CARD', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => MemberCardModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter member cards with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error filtering member cards with filter: ${filter.toJson()}',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberCardModel>>> getAll() async {
    try {
      _logger.info('Fetching all member cards');
      ApiResponse<List<MemberCardModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_CARD', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => MemberCardModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all member cards with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all member cards', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberCardModel>> update(
      MemberCardUpdatePayload payload) async {
    try {
      _logger.info('Updating member card with payload: $payload');
      ApiResponse<MemberCardModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('MEMBER_CARD', 'UPDATE')}',
          payload,
          (json) => MemberCardModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update member card with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating member card with payload: $payload', e, stackTrace);
      rethrow;
    }
  }
}
