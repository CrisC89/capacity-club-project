import 'dart:convert';

import 'package:capacity_club_mobile_app/common/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/common/config/constant.dart';
import 'package:capacity_club_mobile_app/common/model/api_response.dart';
import 'package:capacity_club_mobile_app/common/utils/refresh_token_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  final String _baseURL = BASE_URL;
  late Dio client = Dio();

  factory DioClient() => _instance;

  DioClient._internal() {
    client = Dio(
      BaseOptions(
        baseUrl: _baseURL,
      ),
    );
    client.interceptors.add(RefreshTokenInterceptor());
  }

  Future<ApiResponse<T>> get<T>(
      String path,
      Map<String, dynamic>? queryParameters,
      T Function(Map<String, dynamic> json) fromJsonT) async {
    print('$_baseURL$path');
    try {
      ApiResponse<T> response = ApiResponse.fromJson(
          (await client.get('$_baseURL$path',
                  queryParameters: queryParameters ?? {}))
              .data,
          fromJsonT);
      return response;
    } on DioException catch (e) {
      print(e.response);
      return ApiResponse<T>(result: false, data: null, code: 'SYSTEM_ERROR');
    } catch (e) {
      print('error from post $e');
      return ApiResponse<T>(result: false, data: null, code: 'SYSTEM_ERROR');
    }
  }

  Future<ApiResponse> post<T>(String path, Payload payload,
      T Function(Map<String, dynamic> json) fromJsonT) async {
    try {
      print(
          '------------------------POST--------------------------------------');
      print('$_baseURL$path');
      ApiResponse<T> response = ApiResponse.fromJson(
          (await client.post('$_baseURL$path', data: jsonEncode(payload))).data,
          fromJsonT);
      return response;
    } on DioException catch (e) {
      print(e.response);
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    } catch (e) {
      print('error from post $e');
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    }
  }

  Future<ApiResponse> put<T>(String path, Payload payload,
      T Function(Map<String, dynamic> json) fromJsonT) async {
    try {
      ApiResponse<T> response = ApiResponse.fromJson(
          (await client.put('$_baseURL$path', data: jsonEncode(payload))).data,
          fromJsonT);
      return response;
    } on DioException catch (e) {
      print(e.response);
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    } catch (e) {
      print('error from post $e');
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    }
  }

  Future<ApiResponse<T>> delete<T>(
      String path, T Function(Map<String, dynamic> json) fromJsonT) async {
    try {
      ApiResponse<T> response = ApiResponse<T>.fromJson(
          (await client.delete('$_baseURL$path')).data, fromJsonT);
      print('data from delete');
      print(response);
      return response;
    } on DioException catch (e) {
      print(e.response);
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    } catch (e) {
      print('error from delete $e');
      return ApiResponse<T>(result: false, data: null, code: 'SYSTEM_ERROR');
    }
  }
}
