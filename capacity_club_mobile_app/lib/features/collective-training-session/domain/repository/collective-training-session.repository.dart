import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:either_dart/either.dart';

abstract class CollectiveTrainingSessionRepository {
  Future<Either<Failure, List<CollectiveTrainingSession>>>
      readAllCollectiveTrainingSession();
}