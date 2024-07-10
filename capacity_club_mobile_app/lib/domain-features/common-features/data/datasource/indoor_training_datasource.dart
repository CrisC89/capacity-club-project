import 'package:capacity_club_mobile_app/common/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:capacity_club_mobile_app/common/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/common/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/interface/indoor_training_datasource_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/indoor_training.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/payload/indoor_training_update_payload.dart';

class IndoorTrainingDataSource implements IndoorTrainingDataSourceInterface {
  final DioClient dioClient;

  IndoorTrainingDataSource({required this.dioClient});

  @override
  Future<ApiResponse<IndoorTrainingModel>> detail(String unique_id) async {
    try {
      ApiResponse<IndoorTrainingModel> reponse = await dioClient.get(
          '${ApiURI.getEndpoint('INDOOR_TRAINING', 'DETAIL')}/$unique_id',
          null,
          (json) => IndoorTrainingModel.fromJson(json));

      if (reponse.result != 200) {
        throw ServerException();
      }

      return reponse;
    } catch (e) {
      throw GenericException();
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
        throw ServerException();
      }

      return reponse;
    } catch (e) {
      throw GenericException();
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
        throw ServerException();
      }

      return reponse;
    } catch (e) {
      throw GenericException();
    }
  }
}
