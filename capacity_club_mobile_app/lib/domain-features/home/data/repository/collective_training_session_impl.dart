import 'package:capacity_club_mobile_app/auth/application/pages/login/bloc/login_bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/domain/failure/login_failure.dart';
import 'package:capacity_club_mobile_app/common/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/domain-features/home/data/datasource/collective_training_session_datasource_mock.dart';
import 'package:capacity_club_mobile_app/domain-features/home/data/model/collective_training_session_model.dart';
import 'package:capacity_club_mobile_app/domain-features/home/domain/repository/collective_training_session_repository.dart';
import 'package:either_dart/src/either.dart';

class CollectiveTrainingSessionRepositoryImpl
    extends CollectiveTrainingSessionRepository {
  final ColectiveTrainingSessionDataSourceMock dataSource;

  CollectiveTrainingSessionRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<CollectiveTrainingSessionModel>>>
      getCollectiveTrainingByDate(DateTime session_date) async {
    try {
      final sessions =
          await dataSource.getCollectiveTrainingByDate(session_date);
      return Future.value(Right(sessions));
    } catch (e) {
      return Future.value(Left(LoginFailure()));
    }
  }
}
