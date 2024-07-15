import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/filter/indoor_training_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/payload/indoor_training_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/repository/indoor_training_repository_impl.dart';
import 'package:either_dart/either.dart';

class IndoorTrainingUsecase {
  final IndoorTrainingRepositoryImpl indoorTrainingRepository;

  IndoorTrainingUsecase({required this.indoorTrainingRepository});

  Future<Either<Failure, ApiResponse<List<IndoorTrainingModel>>>> filter(
      IndoorTrainingFilter filter) {
    return this.indoorTrainingRepository.filter(filter);
    //here we can add business logic if we need it
  }

  Future<Either<Failure, ApiResponse<IndoorTrainingModel>>> detail(
      String unique_id) {
    return this.indoorTrainingRepository.detail(unique_id);
    //here we can add business logic if we need it
  }

  Future<Either<Failure, ApiResponse<IndoorTrainingModel>>> update(
      IndoorTrainingUpdatePayload payload) {
    return this.indoorTrainingRepository.update(payload);
    //here we can add business logic if we need it
  }
}
