import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:either_dart/either.dart';

import '../../domain/repository/collective-training-session.repository.dart';

class CollectiveTrainingSessionRepositoryMock
    implements CollectiveTrainingSessionRepository {
  int i = 0;
  final List<CollectiveTrainingSession> collectiveTrainingList = [
    CollectiveTrainingSession(
        collective_training_session_id: 'id_1',
        title: 'Session de Formation 1',
        training_date: DateTime.now(),
        start_hours: '9:00',
        end_hours: '10:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_2',
        title: 'Session de Formation 2',
        training_date: DateTime.now(),
        start_hours: '10:00',
        end_hours: '11:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_3',
        title: 'Session de Formation 3',
        training_date: DateTime.now(),
        start_hours: '11:00',
        end_hours: '12:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_4',
        title: 'Session de Formation 4',
        training_date: DateTime.now(),
        start_hours: '12:00',
        end_hours: '13:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_5',
        title: 'Session de Formation 1',
        training_date: DateTime.now(),
        start_hours: '13:00',
        end_hours: '14:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_1',
        title: 'Session de Formation 1',
        training_date: DateTime.now().add(const Duration(days: 1)),
        start_hours: '9:00',
        end_hours: '10:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_2',
        title: 'Session de Formation 2',
        training_date: DateTime.now().add(const Duration(days: 1)),
        start_hours: '10:00',
        end_hours: '11:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_3',
        title: 'Session de Formation 3',
        training_date: DateTime.now().add(const Duration(days: 1)),
        start_hours: '11:00',
        end_hours: '12:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_4',
        title: 'Session de Formation 4',
        training_date: DateTime.now().add(const Duration(days: 1)),
        start_hours: '12:00',
        end_hours: '13:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_5',
        title: 'Session de Formation 5',
        training_date: DateTime.now().add(const Duration(days: 1)),
        start_hours: '13:00',
        end_hours: '14:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_1',
        title: 'Session de Formation 1',
        training_date: DateTime.now().add(const Duration(days: 2)),
        start_hours: '9:00',
        end_hours: '10:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_2',
        title: 'Session de Formation 2',
        training_date: DateTime.now().add(const Duration(days: 2)),
        start_hours: '10:00',
        end_hours: '11:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_3',
        title: 'Session de Formation 3',
        training_date: DateTime.now().add(const Duration(days: 2)),
        start_hours: '11:00',
        end_hours: '12:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_4',
        title: 'Session de Formation 4',
        training_date: DateTime.now().add(const Duration(days: 2)),
        start_hours: '12:00',
        end_hours: '13:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_5',
        title: 'Session de Formation 5',
        training_date: DateTime.now().add(const Duration(days: 2)),
        start_hours: '13:00',
        end_hours: '14:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_1',
        title: 'Session de Formation 1',
        training_date: DateTime.now().add(const Duration(days: 3)),
        start_hours: '9:00',
        end_hours: '10:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_2',
        title: 'Session de Formation 2',
        training_date: DateTime.now().add(const Duration(days: 3)),
        start_hours: '10:00',
        end_hours: '11:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_3',
        title: 'Session de Formation 3',
        training_date: DateTime.now().add(const Duration(days: 3)),
        start_hours: '11:00',
        end_hours: '12:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_4',
        title: 'Session de Formation 4',
        training_date: DateTime.now().add(const Duration(days: 3)),
        start_hours: '12:00',
        end_hours: '13:00',
        nb_place: 20,
        nb_subscription: 0),
    CollectiveTrainingSession(
        collective_training_session_id: 'id_5',
        title: 'Session de Formation 5',
        training_date: DateTime.now().add(const Duration(days: 3)),
        start_hours: '13:00',
        end_hours: '14:00',
        nb_place: 20,
        nb_subscription: 0),
  ];

  @override
  Future<Either<Failure, List<CollectiveTrainingSession>>>
      readAllCollectiveTrainingSession() {
    try {
      return Future.delayed(
        const Duration(milliseconds: 200),
        () => Right(collectiveTrainingList),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
}
