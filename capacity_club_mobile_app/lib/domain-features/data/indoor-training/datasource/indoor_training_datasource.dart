import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/payload/indoor_training_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/payload/indoor_training_update_payload.dart';
import 'package:logging/logging.dart';

class IndoorTrainingDataSource extends DataSource<
    IndoorTrainingModel,
    IndoorTrainingCreatePayload,
    IndoorTrainingUpdatePayload,
    IndoorTrainingFilter,
    String> {
  final DioClient dioClient;
  final Logger _logger = Logger('IndoorTrainingDataSource');

  IndoorTrainingDataSource({required this.dioClient});

  @override
  Future<ApiResponse<IndoorTrainingModel>> detail(String unique_id) async {
    try {
      ApiResponse<IndoorTrainingModel> reponse = await dioClient.get(
          '${ApiURI.getEndpoint('INDOOR_TRAINING', 'DETAIL')}/$unique_id',
          null,
          (json) => IndoorTrainingModel.fromJson(json));

      if (reponse.result != 200) {
        _logger.warning(
            'Failed to fetch detail for ID: $unique_id with status: ${reponse.result}');
        throw ServerException();
      }

      return reponse;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching detail for ID: $unique_id', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<IndoorTrainingModel>>> filter(
      IndoorTrainingFilter filter) async {
    try {
      ApiResponse<List<IndoorTrainingModel>> reponse = await dioClient.get(
          '${ApiURI.getEndpoint('INDOOR_TRAINING', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => IndoorTrainingModel.fromJson(item))
              .toList());

      if (reponse.result != 200) {
        _logger.warning(
            'Failed to filter data with filter: ${filter.toJson()} and status: ${reponse.result}');
        throw ServerException();
      }

      return reponse;
    } catch (e, stackTrace) {
      _logger.severe('Error filtering data with filter: ${filter.toJson()}', e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<IndoorTrainingModel>> update(
      IndoorTrainingUpdatePayload payload) async {
    try {
      ApiResponse<IndoorTrainingModel> reponse = await dioClient.put(
          '${ApiURI.getEndpoint('INDOOR_TRAINING', 'UPDATE')}',
          payload,
          (json) => IndoorTrainingModel.fromJson(json));

      if (reponse.result != 200) {
        _logger.warning(
            'Failed to update data with payload: $payload and status: ${reponse.result}');
        throw ServerException();
      }

      return reponse;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating data with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<IndoorTrainingModel>> create(
      IndoorTrainingCreatePayload payload) async {
    try {
      ApiResponse<IndoorTrainingModel> reponse = await dioClient.post(
          '${ApiURI.getEndpoint('INDOOR_TRAINING', 'CREATE')}',
          payload,
          (json) => IndoorTrainingModel.fromJson(json));

      if (reponse.result != 200) {
        _logger.warning(
            'Failed to create data with payload: $payload and status: ${reponse.result}');
        throw ServerException();
      }

      return reponse;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating data with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> delete(String uniqueId) async {
    try {
      ApiResponse<IndoorTrainingModel> reponse = await dioClient.delete(
          '${ApiURI.getEndpoint('INDOOR_TRAINING', 'DETAIL')}/$uniqueId',
          (json) => IndoorTrainingModel.fromJson(json));

      if (reponse.result != 200) {
        _logger.warning(
            'Failed to delete data for ID: $uniqueId with status: ${reponse.result}');
        throw ServerException();
      }
    } catch (e, stackTrace) {
      _logger.severe('Error deleting data for ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<IndoorTrainingModel>>> getAll() async {
    try {
      ApiResponse<List<IndoorTrainingModel>> reponse = await dioClient.get(
          '${ApiURI.getEndpoint('INDOOR_TRAINING', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => IndoorTrainingModel.fromJson(item))
              .toList());

      if (reponse.result != 200) {
        _logger
            .warning('Failed to fetch all data with status: ${reponse.result}');
        throw ServerException();
      }

      return reponse;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all data', e, stackTrace);
      rethrow;
    }
  }
}
