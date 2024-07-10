import 'package:capacity_club_mobile_app/common/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/indoor_training.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/payload/indoor_training_update_payload.dart';
import 'package:either_dart/either.dart';

abstract class IndoorTrainingRepository {
  Future<Either<ApiResponse<List<IndoorTrainingModel>>, Failure>> filter(
      IndoorTrainingFilter filter);

  Future<Either<ApiResponse<IndoorTrainingModel>, Failure>> detail(
      String unique_id);

  Future<Either<ApiResponse<IndoorTrainingModel>, Failure>> update(
      IndoorTrainingUpdatePayload payload);
}
