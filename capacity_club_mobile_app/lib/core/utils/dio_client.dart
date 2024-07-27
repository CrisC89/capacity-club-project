import 'dart:convert';

import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/core/config/constant.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/refresh_token_interceptor.dart';
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
      T Function(dynamic json) fromJsonT) async {
    print('$_baseURL$path');
    try {
      ApiResponse<T> response = ApiResponse.fromJson(
          (await client.get('$_baseURL$path',
                  queryParameters: queryParameters ?? {}))
              .data,
          fromJsonT);
      print(
          '--------------------------NOW WE RETURN---------------------------------------------------------');
      return response;
    } on DioException catch (e) {
      print(e.response);
      return ApiResponse<T>(result: false, data: null, code: 'SYSTEM_ERROR');
    } catch (e) {
      print('error from post $e');
      return ApiResponse<T>(result: false, data: null, code: 'SYSTEM_ERROR');
    }
  }

  Future<ApiResponse<T>> filter<T>(
    String path,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic json) fromJsonT, [
    List<T> Function(List<dynamic>)? fromJsonListT,
  ]) async {
    print('$_baseURL$path');
    try {
      final response =
          await client.post('$_baseURL$path', data: queryParameters ?? {});

      final data = response.data;
      print('Raw JSON data: $data');
      print('Type of response.data: ${data.runtimeType}');

      // Passez le paramètre fromJsonListT à ApiResponse.fromJson si nécessaire
      final returnedResponse = ApiResponse.fromJson(data!, fromJsonT);

      print('Returned response: ${returnedResponse}');

      print(
          '--------------------------NOW WE RETURN---------------------------------------------------------');
      return returnedResponse;
    } on DioException catch (e) {
      print(e.response);
      return ApiResponse<T>(result: false, data: null, code: 'SYSTEM_ERROR');
    } catch (e) {
      print('error from post $e');
      return ApiResponse<T>(result: false, data: null, code: 'SYSTEM_ERROR');
    }
  }

  Future<ApiResponse<T>> post<T>(
      String path, Payload payload, T Function(dynamic json) fromJsonT) async {
    try {
      print(
          '------------------------POST--------------------------------------');
      print('$_baseURL$path');
      final response = await client.post<Map<String, dynamic>>(
        '$_baseURL$path',
        data: jsonEncode(payload),
      );
      print(
          '------------------------POST--------------------------------------');
      print(
          '------------------------RESPONSE DATA--------------------------------------');
      print(response.data);
      print(
          '------------------------JSON RESPONSE--------------------------------------');
      // Decode the response data
      print('Type of response.data: ${response.data.runtimeType}');
      if (response.data is Map<String, dynamic>) {
        final jsonResponse = response.data as Map<String, dynamic>;
        final apiResponse = ApiResponse.fromJson(
          jsonResponse,
          fromJsonT,
        );
        print(apiResponse);
      } else {
        print('response.data is not a Map<String, dynamic>');
        return const ApiResponse(
            result: false, data: null, code: 'INVALID_RESPONSE_TYPE');
      }

      final ApiResponse<T> jsonReponse = ApiResponse.fromJson(
        response.data!,
        fromJsonT,
      );

      print(jsonReponse);
      print(
          '------------------------RETURN VALUE--------------------------------------');
      return jsonReponse;
    } on DioException catch (e) {
      print(e.response);
      print('dio exception from post $e');
      return const ApiResponse(
          result: false, data: null, code: 'DIO_SYSTEM_ERROR');
    } catch (e) {
      print('error from post $e');
      return const ApiResponse(result: false, data: null, code: 'SYSTEM_ERROR');
    }
  }

  Future<ApiResponse<T>> put<T>(
      String path, Payload payload, T Function(dynamic json) fromJsonT) async {
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
      String path, T Function(dynamic json) fromJsonT) async {
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
