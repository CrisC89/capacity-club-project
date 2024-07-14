import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/payload/indoor_training_update_payload.dart';

abstract class IndoorTrainingDataSourceInterface {
  Future<ApiResponse<List<IndoorTrainingModel>>> filter(
      IndoorTrainingFilter filter);
  Future<ApiResponse<IndoorTrainingModel>> detail(String unique_id);
  Future<ApiResponse<IndoorTrainingModel>> update(
      IndoorTrainingUpdatePayload payload);
}
