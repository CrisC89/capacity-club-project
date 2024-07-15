import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/filter/member_home_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/member_home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/payload/member_home_training_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/payload/member_home_training_update_payload.dart';
import 'package:logging/logging.dart';

class MemberHomeTrainingDatasource extends DataSource<
    MemberHomeTrainingModel,
    MemberHomeTrainingCreatePayload,
    MemberHomeTrainingUpdatePayload,
    MemberHomeTrainingFilter,
    String> {
  final DioClient dioClient;
  final Logger _logger = Logger('MemberHomeTrainingDatasource');

  MemberHomeTrainingDatasource({required this.dioClient});

  @override
  Future<ApiResponse<MemberHomeTrainingModel>> create(
      MemberHomeTrainingCreatePayload payload) async {
    try {
      _logger.info('Creating member home training with payload: $payload');
      ApiResponse<MemberHomeTrainingModel> response = await dioClient.post(
          '${ApiURI.getEndpoint('MEMBER_HOME_TRAINING', 'CREATE')}',
          payload,
          (json) => MemberHomeTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create member home training with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating member home training with payload: $payload',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<void>> delete(String uniqueId) async {
    try {
      _logger.info('Deleting member home training with ID: $uniqueId');
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('MEMBER_HOME_TRAINING', 'DELETE')}/$uniqueId',
          (json) => MemberHomeTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete member home training with ID: $uniqueId and status: ${response.result}');
        throw ServerException();
      }
      _logger.info('Successfully deleted indoor training with ID: $uniqueId');
      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error deleting member home training with ID: $uniqueId',
          e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberHomeTrainingModel>> detail(String uniqueId) async {
    try {
      _logger.info('Fetching detail for member home training ID: $uniqueId');
      ApiResponse<MemberHomeTrainingModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_HOME_TRAINING', 'DETAIL')}/$uniqueId',
          null,
          (json) => MemberHomeTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for member home training ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error fetching detail for member home training ID: $uniqueId',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberHomeTrainingModel>>> filter(
      MemberHomeTrainingFilter filter) async {
    try {
      _logger.info(
          'Filtering member home trainings with filter: ${filter.toJson()}');
      ApiResponse<List<MemberHomeTrainingModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_HOME_TRAINING', 'FILTER')}',
          filter.toJson(),
          (json) => (json as List)
              .map((item) => MemberHomeTrainingModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to filter member home trainings with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error filtering member home trainings with filter: ${filter.toJson()}',
          e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MemberHomeTrainingModel>>> getAll() async {
    try {
      _logger.info('Fetching all member home trainings');
      ApiResponse<List<MemberHomeTrainingModel>> response = await dioClient.get(
          '${ApiURI.getEndpoint('MEMBER_HOME_TRAINING', 'LIST')}',
          null,
          (json) => (json as List)
              .map((item) => MemberHomeTrainingModel.fromJson(item))
              .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all member home trainings with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all member home trainings', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<MemberHomeTrainingModel>> update(
      MemberHomeTrainingUpdatePayload payload) async {
    try {
      _logger.info('Updating member home training with payload: $payload');
      ApiResponse<MemberHomeTrainingModel> response = await dioClient.put(
          '${ApiURI.getEndpoint('MEMBER_HOME_TRAINING', 'UPDATE')}',
          payload,
          (json) => MemberHomeTrainingModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update member home training with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating member home training with payload: $payload',
          e,
          stackTrace);
      rethrow;
    }
  }
}
