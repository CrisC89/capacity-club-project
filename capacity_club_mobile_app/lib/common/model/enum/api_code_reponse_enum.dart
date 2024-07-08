enum ApiCodeResponse {
  INDOOR_TRAINING_NOT_FOUND('api.error.indoor-training-not-found'),
  INDOOR_TRAINING_DELETE_SUCCESS('api.success.indoor-training-delete'),
  INDOOR_TRAINING_UPDATE_ERROR('api.error.indoor-training-update'),
  INDOOR_TRAINING_UPDATE_SUCCESS('api.success.indoor-training-update'),
  INDOOR_TRAINING_DELETE_ERROR('api.error.indoor-training-delete'),
  INDOOR_TRAINING_LIST_ERROR('api.error.indoor-training-list'),
  INDOOR_TRAINING_LIST_SUCCESS('api.success.indoor-training-list'),
  INDOOR_TRAINING_CREATE_ERROR('api.error.indoor-training-create'),
  INDOOR_TRAINING_CREATE_SUCCESS('api.success.indoor-training-create'),
  UNKNOWN('api.unknown');

  final String value;

  const ApiCodeResponse(this.value);

  // Méthode pour récupérer l'énumération à partir d'une valeur
  static ApiCodeResponse? fromValue(String value) {
    return ApiCodeResponse.values.firstWhere(
      (response) => response.value == value,
      orElse: () => ApiCodeResponse.UNKNOWN,
    );
  }

  // Méthode pour obtenir la valeur d'un code de réponse donné
  static String getValue(ApiCodeResponse codeResponse) {
    return codeResponse.value;
  }
}
