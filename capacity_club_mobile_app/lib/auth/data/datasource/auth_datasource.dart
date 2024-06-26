import 'dart:convert';

import 'package:capacity_club_mobile_app/auth/data/builder/sign_in_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/builder/sign_up_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/interface/auth_datasource_interface.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_and_token_model.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/common/config/constant.dart';
import 'package:capacity_club_mobile_app/common/helper/facebook_helper.dart';
import 'package:capacity_club_mobile_app/common/helper/google_helper.dart';
import 'package:capacity_club_mobile_app/common/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:capacity_club_mobile_app/common/provider/auth_provider.dart';

import 'package:capacity_club_mobile_app/common/utils/dio_client.dart';
import 'package:capacity_club_mobile_app/common/utils/local_storage.dart';
import 'package:capacity_club_mobile_app/common/utils/refresh_token_interceptor.dart';
import 'package:capacity_club_mobile_app/common/widgets/snack-bar/error_snack_bar_widget.dart';
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
  Future<bool> signUp(SignupRequest request) async {
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

  void _checkUser() {
    CredentialAndTokenModel? userData;
    try {
      FromCallableStream(() async => await getToken())
          .map((String? token) => (token != null)
              ? CredentialAndTokenModel.fromJson(jsonDecode(token))
              : null)
          .switchMap((CredentialAndTokenModel? result) {
        userData = result;
        return (result != null)
            ? FromCallableStream(() async => await me())
            : Stream<ApiResponse?>.value(null);
      }).listen((ApiResponse? result) {
        if (result != null && result.result) {
          authProvider.setUser(userData!);
          user$ = userData!;
        } else {
          authProvider.clearUser();
          user$ = null;
        }
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}
