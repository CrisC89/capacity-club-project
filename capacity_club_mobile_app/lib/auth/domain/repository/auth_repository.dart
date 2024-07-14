import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/auth/data/model/payload/sign_up_request.dart';
import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:either_dart/either.dart';

import '../../data/model/payload/sign_in_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signIn(SignInRequest request);

  Future<Either<Failure, bool>> signInWithGoogle();

  Future<Either<Failure, bool>> signInWithFacebook();

  Future<Either<Failure, ApiResponse<CredentialModel>>> me();

  Future<Either<Failure, bool>> signUp(SignUpRequest request);

  Future<Either<Failure, bool>> signupWithGoogle();

  Future<Either<Failure, bool>> signupWithFacebook();

  void logOut();
}
