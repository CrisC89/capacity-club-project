import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/common/abstract/failure.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:either_dart/either.dart';

import '../../data/request/sign_in_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signIn(SignInRequest request);

  Future<Either<Failure, bool>> signInWithGoogle();

  Future<Either<Failure, bool>> signInWithFacebook();

  Future<Either<Failure, ApiResponse>> me();

  Future<Either<Failure, bool>> signUp(SignupRequest request);

  Future<Either<Failure, bool>> signupWithGoogle();

  Future<Either<Failure, bool>> signupWithFacebook();

  void logOut();
}
