import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/auth/data/repository/auth_repository_impl.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/common/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:either_dart/either.dart';

class AuthUseCase {
  final AuthRepositoryImpl authRepository;

  AuthUseCase({required this.authRepository});

  Future<Either<Failure, bool>> signIn(SignInRequest request) {
    return authRepository.signIn(request);
  }

  Future<Either<Failure, bool>> signInWithGoogle() {
    return authRepository.signInWithGoogle();
  }

  Future<Either<Failure, bool>> signInWithFacebook() {
    return authRepository.signInWithFacebook();
  }

  Future<Either<Failure, ApiResponse<CredentialModel>>> me() {
    return authRepository.me();
  }

  Future<Either<Failure, bool>> signUp(SignUpRequest request) {
    return authRepository.signUp(request);
  }

  Future<Either<Failure, bool>> signUpWithGoogle() {
    return authRepository.signupWithGoogle();
  }

  Future<Either<Failure, bool>> signUpWithFacebook() {
    return authRepository.signupWithFacebook();
  }

  void logOut() {
    return authRepository.logOut();
  }
}
