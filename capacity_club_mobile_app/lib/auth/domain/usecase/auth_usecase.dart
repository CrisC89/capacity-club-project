import 'package:capacity_club_mobile_app/auth/data/repository/auth_repository_impl.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/common/model/abstract/failure.dart';
import 'package:either_dart/either.dart';

class AuthUseCase {
  final AuthRepositoryImpl authRepository;

  AuthUseCase({required this.authRepository});

  Future<Either<Failure, bool>> signIn(SignInRequest request) {
    return authRepository.signIn(request);
  }
}
