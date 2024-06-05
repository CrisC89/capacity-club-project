import 'package:capacity_club_mobile_app/common/abstract/failure.dart';
import 'package:capacity_club_mobile_app/domain-features/home/data/model/collective_training_session_model.dart';
import 'package:capacity_club_mobile_app/domain-features/home/data/repository/collective_training_session_impl.dart';
import 'package:capacity_club_mobile_app/domain-features/home/domain/repository/collective_training_session_repository.dart';
import 'package:either_dart/either.dart';

class CollectiveTrainingSessionUseCase {
  final CollectiveTrainingSessionRepositoryImpl repository;

  CollectiveTrainingSessionUseCase(this.repository);

  Future<Either<Failure, List<CollectiveTrainingSessionModel>>>
      getCollectiveTrainingByDate(DateTime session_date) async {
    return repository.getCollectiveTrainingByDate(session_date);
  }
}
