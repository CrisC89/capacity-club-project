import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/filter/home_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/payload/home_training_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/payload/home_training_update_payload.dart';
import 'package:logging/logging.dart';

class HomeTrainingDatasource extends DataSource<
    HomeTrainingModel,
    HomeTrainingCreatePayload,
    HomeTrainingUpdatePayload,
    HomeTrainingFilter,
    String> {
  final DioClient dioClient;
  final Logger _logger = Logger('HomeTrainingDatasource');

  HomeTrainingDatasource({required this.dioClient});

  @override
  Future<ApiResponse<HomeTrainingModel>> create(
      HomeTrainingCreatePayload payload) async {
    try {
      ApiResponse<HomeTrainingModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('HOME_TRAINING', 'CREATE')}',
          payload,
          (json) => HomeTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create home training with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating home training with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<void>> delete(String uniqueId) async {
    try {
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('HOME_TRAINING', 'DELETE')}/$uniqueId',
          (json) => HomeTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete home training with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
      _logger.info('Successfully deleted indoor training with ID: $uniqueId');
      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error deleting home training with ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<HomeTrainingModel>> detail(String uniqueId) async {
    try {
      ApiResponse<HomeTrainingModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('HOME_TRAINING', 'DETAIL')}/$uniqueId',
          null,
          (json) => HomeTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for home training ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching detail for home training ID: $uniqueId', e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<HomeTrainingModel>>> filter(
      HomeTrainingFilter filter) async {
    try {
      ApiResponse<List<HomeTrainingModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('HOME_TRAINING', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => HomeTrainingModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter home trainings with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error filtering home trainings with filter: ${filter.toJson()}',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<HomeTrainingModel>>> getAll() async {
    try {
      ApiResponse<List<HomeTrainingModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('HOME_TRAINING', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => HomeTrainingModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all home trainings with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all home trainings', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<HomeTrainingModel>> update(
      HomeTrainingUpdatePayload payload) async {
    try {
      ApiResponse<HomeTrainingModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('HOME_TRAINING', 'UPDATE')}',
          payload,
          (json) => HomeTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update home training with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating home training with payload: $payload', e, stackTrace);
      rethrow;
    }
  }
}
