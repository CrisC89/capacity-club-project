enum Gender {
  none,
  male,
  female,
  other;

  // Méthode pour obtenir la chaîne associée à l'énumération
  String toJson() {
    switch (this) {
      case Gender.none:
        return 'none';
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
      case Gender.other:
        return 'other';
    }
  }

  // Méthode pour créer une instance d'énumération à partir d'une chaîne JSON
  static Gender fromJson(String json) {
    switch (json) {
      case 'none':
        return Gender.none;
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      case 'other':
        return Gender.other;
      default:
        throw ArgumentError('Unknown gender: $json');
    }
  }
}
