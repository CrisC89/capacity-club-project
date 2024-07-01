import 'package:capacity_club_mobile_app/common/config/constant.dart';
import 'package:capacity_club_mobile_app/common/model/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/common/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/common/utils/local_storage.dart';
import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends Interceptor {
  final LocalStorage localStorage = LocalStorage();
  final String _baseURL = BASE_URL;
  String? token;
  String? refreshToken;
  //List<Map<dynamic, dynamic>> failedRequests = [];
  //bool isRefreshing = false;

  // Instance singleton
  static final RefreshTokenInterceptor _instance =
      RefreshTokenInterceptor._internal();

  factory RefreshTokenInterceptor() {
    return _instance;
  }

  RefreshTokenInterceptor._internal() {
    _retrieveTokens();
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("----dio on request------------");
    print("----option path start------------");
    print(options.path);
    if (!options.path.startsWith('http')) {
      print("----dio on request if http------------");
      options.path = '$_baseURL${options.path}';
    }
    print("----option path------------");
    print(options.path);
    print("----uri path------------");
    print(ApiURI.getEndpoint('ACCOUNT', 'SIGNIN'));
    print("----Relative path------------");
    final relativePath = options.path.replaceFirst(_baseURL, '');
    print(relativePath);
    if (relativePath != ApiURI.getEndpoint('ACCOUNT', 'SIGNIN') &&
        relativePath != ApiURI.getEndpoint('ACCOUNT', 'SIGNUP')) {
      print("----dio on request if path------------");
      options.headers['Authorization'] = 'Bearer $token';
    }
    print("----dio on request after if------------");
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print("----dio on error------------");
    print(err.toString());
    if ((err.response?.statusCode == 401 &&
        err.response?.data['code'] == "api.error.token-expired")) {}
  }

  void _retrieveTokens() async {}

  void _printToken() {
    print('token $token');
    print('refresh $token');
  }

  void setToken(String? value) {
    token = value;
  }

  void setRefreshToken(String? value) {
    refreshToken = value;
  }
}
