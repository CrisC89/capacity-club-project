import 'dart:convert';

import 'package:capacity_club_mobile_app/common/abstract/payload.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:capacity_club_mobile_app/common/utils/config_constant.dart';
import 'package:capacity_club_mobile_app/common/utils/local_storage.dart';
import 'package:capacity_club_mobile_app/common/utils/refresh_token_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  final String _baseURL = BASE_URL;
  late Dio client = Dio();
  //String? token = '';
  //String? refreshToken = '';
  final LocalStorage localStorage = LocalStorage();

  factory DioClient() => _instance;

  DioClient._internal() {
    client = Dio(
      BaseOptions(
        baseUrl: _baseURL, // Remplacez par votre URL de base
      ),
    );
    client.interceptors.add(RefreshTokenInterceptor(localStorage));
  }

  Future<ApiResponse> get(String path) async {
    try {
      ApiResponse response =
          ApiResponse.fromJson((await client.get('$_baseURL$path')).data);
      print('data from get');
      print(response);
      return response;
    } on DioException catch (e) {
      print(e.response);
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    } catch (e) {
      print('error from post $e');
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    }
  }

  Future<ApiResponse> post(String path, Payload payload) async {
    try {
      ApiResponse response = ApiResponse.fromJson(
          (await client.post('$_baseURL$path', data: jsonEncode(payload)))
              .data);
      print('data from post');
      print(response);
      return response;
    } on DioException catch (e) {
      print(e.response);
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    } catch (e) {
      print('error from post $e');
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    }
  }
}
