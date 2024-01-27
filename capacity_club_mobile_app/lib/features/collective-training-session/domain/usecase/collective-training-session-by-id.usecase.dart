import 'package:capacity_club_mobile_app/core/contract/usecase.dart';
import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/repository/collective-training-session.repository.dart';
import 'package:either_dart/either.dart';

class CollectiveTrainingSessionById
    implements
        UseCase<CollectiveTrainingSession, CollectiveTrainingSessionIdParam> {
  final CollectiveTrainingSessionRepository repository;

  const CollectiveTrainingSessionById({required this.repository});

  @override
  Future<Either<Failure, CollectiveTrainingSession>> call(
      CollectiveTrainingSessionIdParam params) async {
    try {
      final session = repository.collectiveTrainingSessionById(
        params.collective_training_session_id,
      );

      return session.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
