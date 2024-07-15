import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/exercise_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/filter/exercise_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/payload/exercise_training_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/payload/exercise_training_update_payload.dart';
import 'package:logging/logging.dart';

class ExerciseTrainingDatasource extends DataSource<
    ExerciseTrainingModel,
    ExerciseTrainingCreatePayload,
    ExerciseTrainingUpdatePayload,
    ExerciseTrainingFilter,
    String> {
  final DioClient dioClient;
  final Logger _logger = Logger('ExerciseTrainingDatasource');

  ExerciseTrainingDatasource({required this.dioClient});

  @override
  Future<ApiResponse<ExerciseTrainingModel>> create(
      ExerciseTrainingCreatePayload payload) async {
    try {
      ApiResponse<ExerciseTrainingModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('EXERCISE_TRAINING', 'CREATE')}',
          payload,
          (json) => ExerciseTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create exercise training with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error creating exercise training with payload: $payload',
          e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> delete(String uniqueId) async {
    try {
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('EXERCISE_TRAINING', 'DELETE')}/$uniqueId',
          (json) => ExerciseTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete exercise training with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
    } catch (e, stackTrace) {
      _logger.severe(
          'Error deleting exercise training with ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<ExerciseTrainingModel>> detail(String uniqueId) async {
    try {
      ApiResponse<ExerciseTrainingModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('EXERCISE_TRAINING', 'DETAIL')}/$uniqueId',
          null,
          (json) => ExerciseTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for exercise training ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error fetching detail for exercise training ID: $uniqueId',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<ExerciseTrainingModel>>> filter(
      ExerciseTrainingFilter filter) async {
    try {
      ApiResponse<List<ExerciseTrainingModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('EXERCISE_TRAINING', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => ExerciseTrainingModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter exercise trainings with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error filtering exercise trainings with filter: ${filter.toJson()}',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<ExerciseTrainingModel>>> getAll() async {
    try {
      ApiResponse<List<ExerciseTrainingModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('EXERCISE_TRAINING', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => ExerciseTrainingModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all exercise trainings with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all exercise trainings', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<ExerciseTrainingModel>> update(
      ExerciseTrainingUpdatePayload payload) async {
    try {
      ApiResponse<ExerciseTrainingModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('EXERCISE_TRAINING', 'UPDATE')}',
          payload,
          (json) => ExerciseTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update exercise training with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error updating exercise training with payload: $payload',
          e, stackTrace);
      rethrow;
    }
  }
}
