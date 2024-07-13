import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/unused/data/interface/collective_training_session_datasource_interface.dart';
import 'package:capacity_club_mobile_app/unused/data/model/collective_training_session_model.dart';

class ColectiveTrainingSessionDataSource
    extends ColectiveTrainingSessionDataSourceInterface {
  @override
  Future<List<CollectiveTrainingSessionModel>> getCollectiveTrainingByDate(
      DateTime session_date) {
    // TODO: implement getCollectiveTrainingByDate
    throw UnimplementedError();
  }
}
