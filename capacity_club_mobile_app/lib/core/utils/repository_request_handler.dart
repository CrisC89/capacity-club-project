import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/model/exception/common_exception.dart';
import 'package:capacity_club_mobile_app/core/model/failure/common_failure.dart';
import 'package:either_dart/either.dart';

mixin RepositoryRequestHandler {
  Future<Either<Failure, ApiResponse<T>>> repositoryHandleRequest<T>(
      Future<ApiResponse<T>> Function() request, Failure failure) async {
    try {
      final response = await request();
      return response.result ? Right(response) : Left(failure);
    } on ServerException catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    } catch (e) {
      return Left(GenericFailure(stackTrace: e.toString()));
    }
  }
}
