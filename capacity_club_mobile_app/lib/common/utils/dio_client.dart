import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  final String _baseURL = 'http://192.168.1.12:2023/api/';
  final Dio client = Dio();
  String? token = '';
  String? refreshToken = '';

  factory DioClient() => _instance;

  DioClient._internal() {
    print('my dio singleton');
    print(_baseURL);
  }
}
