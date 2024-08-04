import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/datasource/indoor_training_subscription_data_source.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/filter/indoor_training_subscription_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/indoor_training_subscription_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/payload/indoor_training_subscription_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training-subscription/model/payload/indoor_training_subscription_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training-subscription/failure/indoor_training_subscription_failure.dart';
import 'package:either_dart/either.dart';

class IndoorTrainingSubscriptionRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<
            IndoorTrainingSubscriptionModel,
            IndoorTrainingSubscriptionCreatePayload,
            IndoorTrainingSubscriptionUpdatePayload,
            IndoorTrainingSubscriptionFilter,
            String> {
  final IndoorTrainingSubscriptionDataSource
      indoorTrainingSubscriptionDataSource;

  IndoorTrainingSubscriptionRepositoryImpl(
      {required this.indoorTrainingSubscriptionDataSource});

  @override
  Future<Either<Failure, ApiResponse<IndoorTrainingSubscriptionModel>>> detail(
      String uniqueId) async {
    return repositoryHandleRequest(
      () => indoorTrainingSubscriptionDataSource.detail(uniqueId),
      IndoorTrainingSubscriptionNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<IndoorTrainingSubscriptionModel>>>>
      filter(IndoorTrainingSubscriptionFilter filter) async {
    print('SEND INDOOR TRAINING SUBSCRIPTION FROM REPOSITORY');
    return repositoryHandleRequest(
      () => indoorTrainingSubscriptionDataSource.filter(filter),
      IndoorTrainingSubscriptionFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<IndoorTrainingSubscriptionModel>>> update(
      IndoorTrainingSubscriptionUpdatePayload payload) async {
    return repositoryHandleRequest(
      () => indoorTrainingSubscriptionDataSource.update(payload),
      IndoorTrainingSubscriptionUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<IndoorTrainingSubscriptionModel>>> create(
      IndoorTrainingSubscriptionCreatePayload payload) async {
    return repositoryHandleRequest(
      () => indoorTrainingSubscriptionDataSource.create(payload),
      IndoorTrainingSubscriptionCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    return repositoryHandleRequest(
      () => indoorTrainingSubscriptionDataSource.delete(uniqueId),
      IndoorTrainingSubscriptionDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<IndoorTrainingSubscriptionModel>>>>
      getAll() async {
    return repositoryHandleRequest(
      () => indoorTrainingSubscriptionDataSource.getAll(),
      IndoorTrainingSubscriptionListFailure(),
    );
  }
}
