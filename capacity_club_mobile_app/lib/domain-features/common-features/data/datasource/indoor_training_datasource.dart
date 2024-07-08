import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/interface/indoor_training_datasource_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/indoor_training.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/payload/indoor_training_update_payload.dart';

class IndoorTrainingDataSource implements IndoorTrainingDataSourceInterface {
  @override
  Future<ApiResponse<IndoorTrainingModel>> detail(String unique_id) {
    // TODO: implement detail
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<IndoorTrainingModel>>> filter(
      IndoorTrainingFilter filter) {
    // TODO: implement filter
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<IndoorTrainingModel>> update(
      IndoorTrainingUpdatePayload payload) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
