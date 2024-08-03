import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/abstract/use_case.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/failure/common_failure.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/mapper/indoor_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/repository/indoor_training_repository_impl.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/failure/indoor_training_failure.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/params/collective_indoor_training_filter_params.dart';
import 'package:either_dart/src/either.dart';

class GetCollectiveIndoorTrainingListByDate
    implements
        UseCase<List<IndoorTrainingEntity>,
            CollectiveIndoorTrainingDateParams> {
  final IndoorTrainingRepositoryImpl indoorTrainingRepository;

  const GetCollectiveIndoorTrainingListByDate(
      {required this.indoorTrainingRepository});

  @override
  Future<Either<Failure, List<IndoorTrainingEntity>>> call(
      CollectiveIndoorTrainingDateParams params) async {
    print('ENTER COLLECTIVE INDOOR TRAINING USECASE');
    try {
      final Either<Failure, ApiResponse<List<IndoorTrainingModel>>> result =
          await indoorTrainingRepository.filter(params.filter);

      return result.fold(
        (failure) => Left(failure),
        (response) {
          if (response.data != null && response.data!.isNotEmpty) {
            final List<IndoorTrainingEntity> entities = response.data!
                .map((model) => IndoorTrainingMapper().toEntity(model))
                .toList();
            return Right(entities);
          } else {
            return Left(
                IndoorTrainingFilterFailure(stackTrace: 'No data available'));
          }
        },
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
