import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/exercise_data_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/filter/exercise_data_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/payload/exercise_data_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-data/model/payload/exercise_data_update_payload.dart';
import 'package:logging/logging.dart';

class ExerciseDataDatasource
    implements
        DataSource<ExerciseDataModel, ExerciseDataCreatePayload,
            ExerciseDataUpdatePayload, ExerciseDataFilter, String> {
  final DioClient dioClient;
  final Logger _logger = Logger('ExerciseDataDatasource');

  ExerciseDataDatasource({required this.dioClient});

  @override
  Future<ApiResponse<ExerciseDataModel>> create(
      ExerciseDataCreatePayload payload) async {
    try {
      ApiResponse<ExerciseDataModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('EXERCISE_DATA', 'CREATE')}',
          payload,
          (json) => ExerciseDataModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create exercise data with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating exercise data with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> delete(String uniqueId) async {
    try {
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('EXERCISE_DATA', 'DELETE')}/$uniqueId',
          (json) => ExerciseDataModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete exercise data with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
    } catch (e, stackTrace) {
      _logger.severe(
          'Error deleting exercise data with ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<ExerciseDataModel>> detail(String uniqueId) async {
    try {
      ApiResponse<ExerciseDataModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('EXERCISE_DATA', 'DETAIL')}/$uniqueId',
          null,
          (json) => ExerciseDataModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for exercise data ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching detail for exercise data ID: $uniqueId', e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<ExerciseDataModel>>> filter(
      ExerciseDataFilter filter) async {
    try {
      ApiResponse<List<ExerciseDataModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('EXERCISE_DATA', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => ExerciseDataModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter exercise data with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error filtering exercise data with filter: ${filter.toJson()}',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<ExerciseDataModel>>> getAll() async {
    try {
      ApiResponse<List<ExerciseDataModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('EXERCISE_DATA', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => ExerciseDataModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all exercise data with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all exercise data', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<ExerciseDataModel>> update(
      ExerciseDataUpdatePayload payload) async {
    try {
      ApiResponse<ExerciseDataModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('EXERCISE_DATA', 'UPDATE')}',
          payload,
          (json) => ExerciseDataModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update exercise data with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating exercise data with payload: $payload', e, stackTrace);
      rethrow;
    }
  }
}
