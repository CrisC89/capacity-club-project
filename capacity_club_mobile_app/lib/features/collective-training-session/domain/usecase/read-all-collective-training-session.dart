import 'package:capacity_club_mobile_app/core/contract/usecase.dart';
import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/repository/collective-training-session.repository.dart';
import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';

class ReadAllCollectiveTrainingSession
    implements UseCase<List<CollectiveTrainingSession>, NoParams> {
  final CollectiveTrainingSessionRepository repository;

  const ReadAllCollectiveTrainingSession({required this.repository});

  @override
  Future<Either<Failure, List<CollectiveTrainingSession>>> call(
      NoParams params) async {
    try {
      final sessions = repository.readAllCollectiveTrainingSession();
      return sessions.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
