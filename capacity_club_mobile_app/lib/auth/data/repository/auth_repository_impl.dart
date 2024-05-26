import 'package:capacity_club_mobile_app/auth/data/datasource/auth_datasource.dart';
import 'package:capacity_club_mobile_app/auth/data/interface/auth_datasource_interface.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/auth/domain/failure/login_failure.dart';
import 'package:capacity_club_mobile_app/auth/domain/repository/auth_repository.dart';
import 'package:capacity_club_mobile_app/common/abstract/failure.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:either_dart/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  void logOut() {
    // TODO: implement logOut
  }

  @override
  Future<Either<Failure, ApiResponse>> me() {
    // TODO: implement me
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signUp(SignupRequest request) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signIn(SignInRequest request) {
    try {
      final result = authDataSource.signin(request);
      print("------ REPO --------");
      print(result);
      return Future.value(Right((result != null)));
    } on Exception catch (e) {
      return Future.value(Left(LoginFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> signupWithFacebook() {
    // TODO: implement signupWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signupWithGoogle() {
    // TODO: implement signupWithGoogle
    throw UnimplementedError();
  }
}
