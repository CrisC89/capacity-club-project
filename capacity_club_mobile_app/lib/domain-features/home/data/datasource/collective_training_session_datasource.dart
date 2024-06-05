import 'package:capacity_club_mobile_app/common/model/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/home/data/interface/collective_training_session_datasource_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/home/data/model/collective_training_session_model.dart';

class ColectiveTrainingSessionDataSource
    extends ColectiveTrainingSessionDataSourceInterface {
  @override
  Future<List<CollectiveTrainingSessionModel>> getCollectiveTrainingByDate(
      DateTime session_date) {
    // TODO: implement getCollectiveTrainingByDate
    throw UnimplementedError();
  }
}
