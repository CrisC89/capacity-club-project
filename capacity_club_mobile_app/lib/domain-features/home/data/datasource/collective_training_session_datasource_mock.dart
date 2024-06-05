import 'package:capacity_club_mobile_app/common/model/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/home/data/interface/collective_training_session_datasource_interface.dart';
import 'package:capacity_club_mobile_app/domain-features/home/data/model/collective_training_session_model.dart';

class ColectiveTrainingSessionDataSourceMock
    extends ColectiveTrainingSessionDataSourceInterface {
  final List<CollectiveTrainingSessionModel> _sessions = List.generate(
    20,
    (index) {
      DateTime baseDate = DateTime.now().add(Duration(days: index ~/ 2));
      return [
        CollectiveTrainingSessionModel(
          collective_training_session_id: UniqueId('A${index}'),
          title: 'Morning Session ${index + 1}',
          training_date: DateTime(baseDate.year, baseDate.month, baseDate.day),
          start_hours: '08:00',
          end_hours: '09:00',
          nb_place: 20 + index,
          nb_subscription: 10 + index,
        ),
        CollectiveTrainingSessionModel(
          collective_training_session_id: UniqueId('B${index}'),
          title: 'Evening Session ${index + 1}',
          training_date: DateTime(baseDate.year, baseDate.month, baseDate.day),
          start_hours: '18:00',
          end_hours: '19:00',
          nb_place: 20 + index,
          nb_subscription: 10 + index,
        ),
      ];
    },
  ).expand((x) => x).toList();

  @override
  Future<List<CollectiveTrainingSessionModel>> getCollectiveTrainingByDate(
      DateTime session_date) async {
    return Future.value(_sessions
        .where((session) =>
            session.training_date.year == session_date.year &&
            session.training_date.month == session_date.month &&
            session.training_date.day == session_date.day)
        .toList());
  }
}
