import 'package:capacity_club_mobile_app/common/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/indoor_training.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/model/payload/indoor_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/data/repository/indoor_training_repository_impl.dart';
import 'package:either_dart/either.dart';

class IndoorTrainingUsecase {
  final IndoorTrainingRepositoryImpl indoorTrainingRepository;

  IndoorTrainingUsecase({required this.indoorTrainingRepository});

  Future<Either<ApiResponse<List<IndoorTrainingModel>>, Failure>> filter(
      IndoorTrainingFilter filter) {
    return this.indoorTrainingRepository.filter(filter);
    //here we can add business logic if we need it
  }

  Future<Either<ApiResponse<IndoorTrainingModel>, Failure>> detail(
      String unique_id) {
    return this.indoorTrainingRepository.detail(unique_id);
    //here we can add business logic if we need it
  }

  Future<Either<ApiResponse<IndoorTrainingModel>, Failure>> update(
      IndoorTrainingUpdatePayload payload) {
    return this.indoorTrainingRepository.update(payload);
    //here we can add business logic if we need it
  }
}
