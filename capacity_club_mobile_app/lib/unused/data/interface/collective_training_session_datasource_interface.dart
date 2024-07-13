import 'package:capacity_club_mobile_app/unused/data/model/collective_training_session_model.dart';

abstract class ColectiveTrainingSessionDataSourceInterface {
  Future<List<CollectiveTrainingSessionModel>> getCollectiveTrainingByDate(
      DateTime session_date);
}
