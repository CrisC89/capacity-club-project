class ApiResponse<T> {
  final bool result;
  final T? data;
  final String code;

  const ApiResponse({
    required this.result,
    required this.data,
    required this.code,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    final resultValue = json['result'];
    final dataValue = json['data'];
    final codeValue = json['code'];

    T? data;
    data = fromJsonT(dataValue);
    print(data);

    return ApiResponse<T>(
      result: resultValue as bool? ?? false,
      data: data,
      code: codeValue as String? ?? 'UNKNOWN_CODE',
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result,
        'data': data,
        'code': code,
      };
}


/*
  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    /*API RESPONSE FROM JSON*/
    print("ENTER FROM JSON");
    print("JSON: $json");
    print("Type of JSON: ${json.runtimeType}");

    final resultValue = json['result'];
    final dataValue = json['data'];
    final codeValue = json['code'];

    print("Type of resultValue: ${resultValue.runtimeType}");
    print("Type of dataValue: ${dataValue.runtimeType}");
    print("Type of codeValue: ${codeValue.runtimeType}");
    final response = ApiResponse(
      result: resultValue as bool? ?? false,
      data: dataValue != null
          ? fromJsonT(dataValue as Map<String, dynamic>)
          : null,
      code: codeValue as String? ?? 'UNKNOWN_CODE',
    );
    print("RETURN FROM JSON RESPONSE : $response");
    return response;
  }
  */

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
