import 'dart:convert';

import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/data_source_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/filter/indoor_training_subscription_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/indoor_training_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/payload/indoor_training_subscription_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/payload/indoor_training_subscription_update_payload.dart';
import 'package:logging/logging.dart';

class IndoorTrainingSubscriptionDataSource extends DataSource<
    IndoorTrainingSubscriptionModel,
    IndoorTrainingSubscriptionCreatePayload,
    IndoorTrainingSubscriptionUpdatePayload,
    IndoorTrainingSubscriptionFilter,
    String> {
  final DioClient dioClient;
  final Logger _logger = Logger('IndoorTrainingDataSource');

  IndoorTrainingSubscriptionDataSource({required this.dioClient});
  @override
  Future<ApiResponse<IndoorTrainingSubscriptionModel>> create(
      IndoorTrainingSubscriptionCreatePayload payload) async {
    try {
      ApiResponse<IndoorTrainingSubscriptionModel> response =
          await dioClient.post(
              '${ApiURI.getEndpoint('INDOOR_TRAINING_SUBSCRIPTION', 'CREATE')}',
              payload,
              (json) => IndoorTrainingSubscriptionModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to create data with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error creating data with payload: $payload', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<void>> delete(String uniqueId) async {
    try {
      ApiResponse<void> response = await dioClient.delete(
          '${ApiURI.getEndpoint('INDOOR_TRAINING_SUBSCRIPTION', 'DETAIL')}/$uniqueId',
          (json) => IndoorTrainingSubscriptionModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to delete data for ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }
      _logger.info(
          'Successfully deleted indoor training subscription with ID: $uniqueId');
      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error deleting data for ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<IndoorTrainingSubscriptionModel>> detail(
      String uniqueId) async {
    try {
      ApiResponse<IndoorTrainingSubscriptionModel> response = await dioClient.get(
          '${ApiURI.getEndpoint('INDOOR_TRAINING_SUBSCRIPTION', 'DETAIL')}/$uniqueId',
          null,
          (json) => IndoorTrainingSubscriptionModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch detail for ID: $uniqueId with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching detail for ID: $uniqueId', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<IndoorTrainingSubscriptionModel>>> filter(
      IndoorTrainingSubscriptionFilter filter) async {
    print("ENTER TO INDOOR TRAINING SUBSCRIPTION FILTER METHOD");

    try {
      ApiResponse<List<IndoorTrainingSubscriptionModel>> response =
          await dioClient.filter(
        '${ApiURI.getEndpoint('INDOOR_TRAINING_SUBSCRIPTION', 'FILTER')}',
        filter.toJson(),
        (json) => (json as List).map((item) {
          return IndoorTrainingSubscriptionModel.fromJson(item);
        }).toList(),
      );

      print("AFTER DIO RETURN");

      print(response.result);

      if (!response.result) {
        _logger.warning(
            'Failed to filter data with filter: ${filter.toJson()} and status: ${response.result}');
        throw ServerException();
      }

      print('SEND INDOOR TRAINING SUBSCRIPTION FROM DATA SOURCE');

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error filtering data with filter: ${filter.toJson()}', e,
          stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<IndoorTrainingSubscriptionModel>>> getAll() async {
    try {
      ApiResponse<List<IndoorTrainingSubscriptionModel>> response =
          await dioClient.get(
              '${ApiURI.getEndpoint('INDOOR_TRAINING_SUBSCRIPTION', 'LIST')}',
              null,
              (json) => (json as List)
                  .map((item) => IndoorTrainingSubscriptionModel.fromJson(item))
                  .toList());

      if (response.result != 200) {
        _logger.warning(
            'Failed to fetch all data with status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe('Error fetching all data', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<IndoorTrainingSubscriptionModel>> update(
      IndoorTrainingSubscriptionUpdatePayload payload) async {
    try {
      ApiResponse<IndoorTrainingSubscriptionModel> response =
          await dioClient.put(
              '${ApiURI.getEndpoint('INDOOR_TRAINING_SUBSCRIPTION', 'UPDATE')}',
              payload,
              (json) => IndoorTrainingSubscriptionModel.fromJson(json));

      if (response.result != 200) {
        _logger.warning(
            'Failed to update data with payload: $payload and status: ${response.result}');
        throw ServerException();
      }

      return response;
    } catch (e, stackTrace) {
      _logger.severe(
          'Error updating data with payload: $payload', e, stackTrace);
      rethrow;
    }
  }
}
