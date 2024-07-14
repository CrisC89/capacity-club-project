import 'dart:convert';

import 'package:capacity_club_mobile_app/auth/data/builder/sign_in_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/builder/sign_up_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/datasource/interface/auth_datasource_interface.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_and_token_model.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/auth/data/model/payload/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/model/payload/sign_up_request.dart';
import 'package:capacity_club_mobile_app/core/config/constant.dart';
import 'package:capacity_club_mobile_app/core/model/helper/facebook_helper.dart';
import 'package:capacity_club_mobile_app/core/model/helper/google_helper.dart';
import 'package:capacity_club_mobile_app/core/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';

import 'package:capacity_club_mobile_app/core/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/core/utils/local_storage.dart';
import 'package:capacity_club_mobile_app/core/utils/refresh_token_interceptor.dart';
import 'package:capacity_club_mobile_app/core/widgets/snack-bar/error_snack_bar_widget.dart';
import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class AuthDataSource implements AuthDataSourceInterface {
  static final LocalStorage localStorage = LocalStorage();
  //late bool? isAuthenticated$ = null;
  CredentialAndTokenModel? user$ = null;
  final AuthProvider authProvider = AuthProvider();
  final DioClient dioClient;

  AuthDataSource({required this.dioClient});

  @override
  Future<bool> signin(SignInRequest request) async {
    print(
        '-------------------------------SIGNIN--------------------------------------');
    print(ApiURI.getEndpoint('ACCOUNT', 'SIGNIN'));
    ApiResponse<CredentialAndTokenModel> response =
        await dioClient.post<CredentialAndTokenModel>(
                ApiURI.getEndpoint('ACCOUNT', 'SIGNIN'),
                request,
                (json) => CredentialAndTokenModel.fromJson(json))
            as ApiResponse<CredentialAndTokenModel>;
    print(
        '-------------------------------AFTER RESPONSE--------------------------------------');
    RefreshTokenInterceptor().setToken(response.data?.token);
    RefreshTokenInterceptor().setRefreshToken(response.data?.refreshToken);
    print(response.code);
    if (!response.result) {
      errorSnackBar('_apiService.messageFromCode(response.code)');
    }
    AuthProvider().login();
    return handleSignInSignUpPostProcess(response);
  }

  @override
  Future<String?> getToken() async {
    return await localStorage.read(USER_KEY);
  }

  @override
  Future<bool> handleSignInSignUpPostProcess(ApiResponse response) async {
    try {
      if (response.result) {
        await localStorage.write(USER_KEY, jsonEncode(response.data));
        String? data = await localStorage.read(USER_KEY);
        print(data);
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
    //user$.add(null);
    localStorage.deleteAll();
  }

  @override
  Future<ApiResponse<CredentialModel>> me() async {
    ApiResponse<CredentialModel> response =
        await dioClient.get<CredentialModel>(
            ApiURI.getEndpoint('ACCOUNT', 'ME'),
            {},
            (json) => CredentialModel.fromJson(json));
    if (!response.result) {
      errorSnackBar('_apiService.messageFromCode(response.code)');
    }
    print('Reponse from me ${response.toJson()}');
    return response;
  }

  @override
  Future<bool> signInWithFacebook() async {
    try {
      String? data = await FacebookHelper.signIn();
      if (data != null) {
        return signin(SignInRequestBuilder()
            .setFacebookHash(_hashUsername(data))
            .build());
      } else {
        errorSnackBar(
            "_apiService.translateService.locale.google_signin_not_user_selected_or_error");
        return false;
      }
    } on Exception catch (e) {
      errorSnackBar(e.toString());
      return false;
    }
  }

  @override
  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignInAccount? data = await GoogleHelper.signIn();
      if (data != null) {
        return signin(SignInRequestBuilder()
            .setGoogleHash(_hashUsername('${data.email}${data.id}'))
            .build());
      } else {
        errorSnackBar(
            '_apiService.translateService.locale.google_signin_not_user_selected_or_error');
        return false;
      }
    } on Exception catch (e) {
      errorSnackBar(e.toString());
      return false;
    }
  }

  @override
  Future<bool> signUp(SignUpRequest request) async {
    print('signUp request ${request.toJson()}');
    ApiResponse<CredentialAndTokenModel>? response =
        await dioClient.post<CredentialAndTokenModel>(
                ApiURI.getEndpoint('ACCOUNT', 'SIGNUP'),
                request,
                (json) => CredentialAndTokenModel.fromJson(json))
            as ApiResponse<CredentialAndTokenModel>;
    if (!response.result) {
      errorSnackBar('_apiService.messageFromCode(response.code)');
    }

    RefreshTokenInterceptor().setToken(response.data?.token);
    RefreshTokenInterceptor().setRefreshToken(response.data?.refreshToken);
    AuthProvider().login();
    return handleSignInSignUpPostProcess(response);
  }

  @override
  Future<bool> signupWithFacebook() async {
    try {
      print('OK before Facebook API call');
      Map<String, dynamic>? data = await FacebookHelper.signUp();
      print('OK after Facebook API call');
      if (data != null) {
        String email = '';
        String id = '';
        for (MapEntry<String, dynamic> item in data.entries) {
          if (item.key == 'email') {
            email = item.value;
          } else if (item.key == 'id') {
            id = item.value;
          }
        }
        return signUp(SignUpRequestBuilder()
            .setUsername('')
            .setGoogleHash('')
            .setFacebookHash(_hashUsername(email + id))
            .build());
      } else {
        errorSnackBar(
            '_apiService.translateService.locale.google_signin_not_user_selected_or_error');
        return false;
      }
    } on Exception catch (e) {
      print('---- Facebook Exception : $e');
      errorSnackBar(e.toString());
      return false;
    }
  }

  @override
  Future<bool> signupWithGoogle() async {
    try {
      print('OK before Google API call');
      GoogleSignInAccount? data = await GoogleHelper.signIn();
      print('OK after Google API call');
      if (data != null) {
        return signUp(SignUpRequestBuilder()
            .setUsername('')
            .setFacebookHash('')
            .setGoogleHash(_hashUsername('${data.email}${data.id}'))
            .build());
      } else {
        errorSnackBar(
            '_apiService.translateService.locale.google_signin_not_user_selected_or_error');
        return false;
      }
    } on Exception catch (e) {
      print('---- Google Exception : $e');
      //errorSnackBar(e.toString());
      return false;
    }
  }

  String _hashUsername(String string) {
    var bytes = utf8.encode(string);
    return sha1.convert(bytes).toString();
  }
}
