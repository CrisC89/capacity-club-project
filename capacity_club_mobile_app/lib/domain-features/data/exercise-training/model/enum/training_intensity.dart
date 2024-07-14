enum TrainingIntensity {
  none('None'),
  low('Low'),
  medium('Medium'),
  high('High');

  // Le champ `description` est défini dans le constructeur de l'énumération.
  const TrainingIntensity(this.description);

  // Description de chaque niveau d'intensité.
  final String description;

  // Méthode pour obtenir la description basée sur le nom de l'intensité en majuscules.
  static String getValue(String intensity) {
    switch (intensity.toUpperCase()) {
      case 'NONE':
        return TrainingIntensity.none.description;
      case 'LOW':
        return TrainingIntensity.low.description;
      case 'MEDIUM':
        return TrainingIntensity.medium.description;
      case 'HIGH':
        return TrainingIntensity.high.description;
      default:
        throw Exception('TrainingIntensity not found');
    }
  }

  // Convertit le niveau d'intensité en une chaîne pour JSON.
  String toJson() {
    switch (this) {
      case TrainingIntensity.none:
        return 'none';
      case TrainingIntensity.low:
        return 'low';
      case TrainingIntensity.medium:
        return 'medium';
      case TrainingIntensity.high:
        return 'high';
    }
  }

  // Convertit une chaîne JSON en une instance de l'énumération.
  static TrainingIntensity fromJson(String json) {
    switch (json) {
      case 'none':
        return TrainingIntensity.none;
      case 'low':
        return TrainingIntensity.low;
      case 'medium':
        return TrainingIntensity.medium;
      case 'high':
        return TrainingIntensity.high;
      default:
        throw ArgumentError('Unknown intensity: $json');
    }
  }
}
