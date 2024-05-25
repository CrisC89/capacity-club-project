import 'package:capacity_club_mobile_app/common/enum/api_uri_enum.dart';
import 'package:capacity_club_mobile_app/common/utils/config_constant.dart';
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
    if (!options.path.contains('http')) {
      options.path = '$_baseURL${options.path}';
    }
    if (options.path != ApiURI.getEndpoint('ACCOUNT', 'SIGNIN') &&
        options.path != ApiURI.getEndpoint('ACCOUNT', 'SIGNUP')) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
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
