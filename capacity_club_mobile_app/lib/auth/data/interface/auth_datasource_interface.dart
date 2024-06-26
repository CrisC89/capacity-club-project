import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';

abstract class AuthDataSourceInterface {
  Future<bool> signin(SignInRequest request);

  Future<bool> signInWithGoogle();

  Future<bool> signInWithFacebook();

  Future<ApiResponse> me();

  Future<bool> signUp(SignupRequest request);

  Future<bool> signupWithGoogle();

  Future<bool> signupWithFacebook();

  void logOut();

  String _hashUsername(String string);

  Future<bool> handleSignInSignUpPostProcess(ApiResponse response);

  Future<String?> getToken();

  void _checkUser();
}
