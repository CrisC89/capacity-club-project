import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/filter/training_circuit_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/payload/training_circuit_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/payload/training_circuit_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/training-circuit/model/training_circuit_model.dart';
import 'package:logging/logging.dart';

class TrainingCircuitDatasource extends DataSource<
    TrainingCircuitModel,
    TrainingCircuitCreatePayload,
    TrainingCircuitUpdatePayload,
    TrainingCircuitFilter,
    String> {
  final DioClient dioClient;
  final Logger _logger = Logger('TrainingCircuitDatasource');

  TrainingCircuitDatasource({required this.dioClient});

  @override
  Future<ApiResponse<TrainingCircuitModel>> create(
      TrainingCircuitCreatePayload payload) async {
    try {
      _logger.info('Creating training circuit with payload: $payload');
      ApiResponse<TrainingCircuitModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('TRAINING_CIRCUIT', 'CREATE')}',
          payload,
          (json) => TrainingCircuitModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create training circuit with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error creating training circuit with payload: $payload',
          e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<void>> delete(String uniqueId) async {
    try {
      _logger.info('Deleting training circuit with ID: $uniqueId');
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('TRAINING_CIRCUIT', 'DELETE')}/$uniqueId',
          (json) => TrainingCircuitModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete training circuit with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
      _logger.info('Successfully deleted indoor training with ID: $uniqueId');
      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error deleting training circuit with ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<TrainingCircuitModel>> detail(String uniqueId) async {
    try {
      _logger.info('Fetching detail for training circuit ID: $uniqueId');
      ApiResponse<TrainingCircuitModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('TRAINING_CIRCUIT', 'DETAIL')}/$uniqueId',
          null,
          (json) => TrainingCircuitModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for training circuit ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching detail for training circuit ID: $uniqueId',
          e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<TrainingCircuitModel>>> filter(
      TrainingCircuitFilter filter) async {
    try {
      _logger
          .info('Filtering training circuits with filter: ${filter.toJson()}');
      ApiResponse<List<TrainingCircuitModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('TRAINING_CIRCUIT', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => TrainingCircuitModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter training circuits with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error filtering training circuits with filter: ${filter.toJson()}',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<TrainingCircuitModel>>> getAll() async {
    try {
      _logger.info('Fetching all training circuits');
      ApiResponse<List<TrainingCircuitModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('TRAINING_CIRCUIT', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => TrainingCircuitModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all training circuits with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all training circuits', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<TrainingCircuitModel>> update(
      TrainingCircuitUpdatePayload payload) async {
    try {
      _logger.info('Updating training circuit with payload: $payload');
      ApiResponse<TrainingCircuitModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('TRAINING_CIRCUIT', 'UPDATE')}',
          payload,
          (json) => TrainingCircuitModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update training circuit with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error updating training circuit with payload: $payload',
          e, stackTrace);
      rethrow;
    }
  }
}
