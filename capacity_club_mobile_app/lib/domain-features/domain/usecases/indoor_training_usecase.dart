import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/domain-features/data/models/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/models/indoor_training.dart';
import 'package:capacity_club_mobile_app/domain-features/data/models/payload/indoor_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/repositories/indoor_training_repository_impl.dart';
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
