import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/address_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/filter/address_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/payload/address_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/payload/address_update_payload.dart';
import 'package:logging/logging.dart';

class AddressDatasource extends DataSource<AddressModel, AddressCreatePayload,
    AddressUpdatePayload, AddressFilter, String> {
  final DioClient dioClient;
  final Logger _logger = Logger('AddressDatasource');

  AddressDatasource({required this.dioClient});

  @override
  Future<ApiResponse<AddressModel>> create(AddressCreatePayload payload) async {
    try {
      ApiResponse<AddressModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('ADDRESS', 'CREATE')}',
          payload,
          (json) => AddressModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create address with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating address with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<void>> delete(String uniqueId) async {
    try {
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('ADDRESS', 'DELETE')}/$uniqueId',
          (json) => AddressModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete address with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
      _logger.info('Successfully deleted indoor training with ID: $uniqueId');
      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error deleting address with ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<AddressModel>> detail(String uniqueId) async {
    try {
      ApiResponse<AddressModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('ADDRESS', 'DETAIL')}/$uniqueId',
          null,
          (json) => AddressModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for address ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error fetching detail for address ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<AddressModel>>> filter(AddressFilter filter) async {
    try {
      ApiResponse<List<AddressModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('ADDRESS', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => AddressModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter addresses with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error filtering addresses with filter: ${filter.toJson()}',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<AddressModel>>> getAll() async {
    try {
      ApiResponse<List<AddressModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('ADDRESS', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => AddressModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all addresses with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all addresses', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<AddressModel>> update(AddressUpdatePayload payload) async {
    try {
      ApiResponse<AddressModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('ADDRESS', 'UPDATE')}',
          payload,
          (json) => AddressModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update address with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating address with payload: $payload', e, stackTrace);
      rethrow;
    }
  }
}
