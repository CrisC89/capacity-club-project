import 'dart:core';

import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/common/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/domain-features/home/data/model/collective_training_session_model.dart';
import 'package:either_dart/either.dart';

abstract class CollectiveTrainingSessionRepository {
  Future<Either<Failure, List<CollectiveTrainingSessionModel>>>
      getCollectiveTrainingByDate(DateTime session_date);
}
