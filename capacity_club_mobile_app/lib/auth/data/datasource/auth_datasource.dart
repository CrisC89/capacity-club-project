import 'dart:convert';

import 'package:capacity_club_mobile_app/auth/data/interface/auth_datasource_interface.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_and_token_model.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/common/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:capacity_club_mobile_app/common/utils/config_constant.dart';
import 'package:capacity_club_mobile_app/common/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/common/utils/local_storage.dart';
import 'package:capacity_club_mobile_app/common/utils/refresh_token_interceptor.dart';

class AuthDataSource implements AuthDataSourceInterface {
  static final LocalStorage localStorage = LocalStorage();
  final bool? isAuthenticated$ = null;
  final CredentialAndTokenModeluser$ = null;
  final DioClient dioClient = DioClient();

  @override
  Future<bool> signin(SignInRequest request) async {
    ApiResponse<CredentialAndTokenModel> response =
        await dioClient.post<CredentialAndTokenModel>(
                ApiURI.getEndpoint('ACCOUNT', 'SIGNIN'),
                request,
                (json) => CredentialAndTokenModel.fromJson(json))
            as ApiResponse<CredentialAndTokenModel>;
    RefreshTokenInterceptor().setToken(response.data?.token);
    RefreshTokenInterceptor().setRefreshToken(response.data?.refreshToken);

    if (!response.result) {
      print(response.code);
      // errorSnackBar(_apiService.messageFromCode(response.code));
    }
    return handleSignInSignupPostProcess(response);
  }

  @override
  Future<String?> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<bool> handleSignInSignupPostProcess(ApiResponse response) async {
    try {
      if (response.result) {
        await localStorage.write(USER_KEY, jsonEncode(response.data));
        String? data = await localStorage.read(USER_KEY);
        //print(data);
        if (data == null) {
          return Future(() => false);
        }
        print('ok');
        CredentialAndTokenModel userData =
            CredentialAndTokenModel.fromJson(jsonDecode(data));
        print('userData $userData');
        return true;
      }
      return Future(() => false);
    } catch (e) {
      print(e);
      return Future(() => false);
    }
  }

  @override
  void logOut() {
    // TODO: implement logOut
  }

  @override
  Future<ApiResponse> me() {
    // TODO: implement me
    throw UnimplementedError();
  }

  @override
  Future<bool> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<bool> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(SignupRequest request) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<bool> signupWithFacebook() {
    // TODO: implement signupWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<bool> signupWithGoogle() {
    // TODO: implement signupWithGoogle
    throw UnimplementedError();
  }
}
