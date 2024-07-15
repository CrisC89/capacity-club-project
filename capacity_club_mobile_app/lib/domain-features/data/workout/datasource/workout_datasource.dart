import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/filter/workout_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/payload/workout_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/payload/workout_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/workout/model/workout_model.dart';
import 'package:logging/logging.dart';

class WorkoutDatasource extends DataSource<WorkoutModel, WorkoutCreatePayload,
    WorkoutUpdatePayload, WorkoutFilter, String> {
  final DioClient dioClient;
  final Logger _logger = Logger('WorkoutDatasource');

  WorkoutDatasource({required this.dioClient});

  @override
  Future<ApiResponse<WorkoutModel>> create(WorkoutCreatePayload payload) async {
    try {
      _logger.info('Creating workout with payload: $payload');
      ApiResponse<WorkoutModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('WORKOUT', 'CREATE')}',
          payload,
          (json) => WorkoutModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create workout with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating workout with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<void>> delete(String uniqueId) async {
    try {
      _logger.info('Deleting workout with ID: $uniqueId');
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('WORKOUT', 'DELETE')}/$uniqueId',
          (json) => WorkoutModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete workout with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
      _logger.info('Successfully deleted indoor training with ID: $uniqueId');
      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error deleting workout with ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<WorkoutModel>> detail(String uniqueId) async {
    try {
      _logger.info('Fetching detail for workout ID: $uniqueId');
      ApiResponse<WorkoutModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('WORKOUT', 'DETAIL')}/$uniqueId',
          null,
          (json) => WorkoutModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for workout ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error fetching detail for workout ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<WorkoutModel>>> filter(WorkoutFilter filter) async {
    try {
      _logger.info('Filtering workouts with filter: ${filter.toJson()}');
      ApiResponse<List<WorkoutModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('WORKOUT', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => WorkoutModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter workouts with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error filtering workouts with filter: ${filter.toJson()}',
          e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<WorkoutModel>>> getAll() async {
    try {
      _logger.info('Fetching all workouts');
      ApiResponse<List<WorkoutModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('WORKOUT', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => WorkoutModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all workouts with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all workouts', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<WorkoutModel>> update(WorkoutUpdatePayload payload) async {
    try {
      _logger.info('Updating workout with payload: $payload');
      ApiResponse<WorkoutModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('WORKOUT', 'UPDATE')}',
          payload,
          (json) => WorkoutModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update workout with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating workout with payload: $payload', e, stackTrace);
      rethrow;
    }
  }
}
