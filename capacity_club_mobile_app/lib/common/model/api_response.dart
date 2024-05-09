class ApiResponse {
  final bool result;
  final Map<String, dynamic>? data;
  //final dynamic? data;
  final String code;

  const ApiResponse({
    required this.result,
    required this.data,
    required this.code,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      result: json['result'],
      data: json['data'],
      code: json['code'],
    );
  }

  /*
  factory ApiResponse.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return ApiResponse(
        result: json['result'],
        data: json['data'],
        code: json['code'],
      );
    } else if (json is List) {
      return ApiResponse(
        result: true,
        data: json,
        code: 'SUCCESS',
      );
    } else {
      return const ApiResponse(
        result: false,
        data: null,
        code: 'INVALID_FORMAT',
      );
    }
  }

  */

  Map<String, dynamic> toJson() => {
        'result': result,
        'data': data,
        'code': code,
      };
}
