import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/domain-features/data/models/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/models/indoor_training.dart';
import 'package:capacity_club_mobile_app/domain-features/data/models/payload/indoor_training_update_payload.dart';
import 'package:either_dart/either.dart';

abstract class IndoorTrainingRepository {
  Future<Either<ApiResponse<List<IndoorTrainingModel>>, Failure>> filter(
      IndoorTrainingFilter filter);

  Future<Either<ApiResponse<IndoorTrainingModel>, Failure>> detail(
      String unique_id);

  Future<Either<ApiResponse<IndoorTrainingModel>, Failure>> update(
      IndoorTrainingUpdatePayload payload);
}
