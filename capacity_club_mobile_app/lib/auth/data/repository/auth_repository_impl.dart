import 'package:capacity_club_mobile_app/auth/data/datasource/auth_datasource.dart';
import 'package:capacity_club_mobile_app/auth/data/datasource/interface/auth_datasource_interface.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/auth/data/model/payload/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/model/payload/sign_up_request.dart';
import 'package:capacity_club_mobile_app/auth/domain/failure/login_failure.dart';
import 'package:capacity_club_mobile_app/auth/domain/repository/auth_repository.dart';
import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:either_dart/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  void logOut() {
    authDataSource.logOut();
  }

  @override
  Future<Either<Failure, ApiResponse<CredentialModel>>> me() async {
    try {
      final result = await authDataSource.me();
      print("------ REPO --------");
      print(result);
      return Future.value(Right((result)));
    } on Exception catch (e) {
      return Future.value(Left(LoginFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithFacebook() async {
    try {
      final result = await authDataSource.signInWithFacebook();
      print("------ REPO --------");
      print(result);
      return Future.value(Right((result != null)));
    } on Exception catch (e) {
      return Future.value(Left(LoginFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    try {
      final result = await authDataSource.signInWithGoogle();
      print("------ REPO --------");
      print(result);
      return Future.value(Right((result != null)));
    } on Exception catch (e) {
      return Future.value(Left(LoginFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(SignUpRequest request) async {
    try {
      final result = await authDataSource.signUp(request);
      print("------ REPO --------");
      print(result);
      return Future.value(Right((result != null)));
    } on Exception catch (e) {
      return Future.value(Left(LoginFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> signIn(SignInRequest request) async {
    try {
      final result = await authDataSource.signin(request);
      print("------ REPO --------");
      print(result);
      return Future.value(Right((result != null)));
    } on Exception catch (e) {
      return Future.value(Left(LoginFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> signupWithFacebook() async {
    try {
      final result = await authDataSource.signupWithFacebook();
      print("------ REPO --------");
      print(result);
      return Future.value(Right((result != null)));
    } on Exception catch (e) {
      return Future.value(Left(LoginFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> signupWithGoogle() async {
    try {
      final result = await authDataSource.signInWithGoogle();
      print("------ REPO --------");
      print(result);
      return Future.value(Right((result != null)));
    } on Exception catch (e) {
      return Future.value(Left(LoginFailure()));
    }
  }
}
