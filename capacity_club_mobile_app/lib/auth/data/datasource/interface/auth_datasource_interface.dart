import 'package:capacity_club_mobile_app/auth/data/model/payload/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/model/payload/sign_up_request.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';

abstract class AuthDataSourceInterface {
  Future<bool> signin(SignInRequest request);

  Future<bool> signInWithGoogle();

  Future<bool> signInWithFacebook();

  Future<ApiResponse> me();

  Future<bool> signUp(SignUpRequest request);

  Future<bool> signupWithGoogle();

  Future<bool> signupWithFacebook();

  void logOut();

  Future<bool> handleSignInSignUpPostProcess(ApiResponse response);

  Future<String?> getToken();
}
