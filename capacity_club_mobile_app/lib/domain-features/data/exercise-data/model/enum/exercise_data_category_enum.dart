enum ExerciseDataCategory {
  cardio('Cardio'),
  strength('Strength'),
  flexibility('Flexibility'),
  balance('Balance');

  // Le champ `description` est défini dans le constructeur de l'énumération.
  const ExerciseDataCategory(this.description);

  // Description de chaque catégorie.
  final String description;

  // Méthode pour obtenir la description de la catégorie basée sur la chaîne d'entrée.
  static String getValue(String category) {
    switch (category.toUpperCase()) {
      case 'CARDIO':
        return ExerciseDataCategory.cardio.description;
      case 'STRENGTH':
        return ExerciseDataCategory.strength.description;
      case 'FLEXIBILITY':
        return ExerciseDataCategory.flexibility.description;
      case 'BALANCE':
        return ExerciseDataCategory.balance.description;
      default:
        throw Exception('ExerciseDataCategory not found');
    }
  }

  // Convertit la catégorie en une chaîne pour JSON.
  String toJson() {
    switch (this) {
      case ExerciseDataCategory.cardio:
        return 'cardio';
      case ExerciseDataCategory.strength:
        return 'strength';
      case ExerciseDataCategory.flexibility:
        return 'flexibility';
      case ExerciseDataCategory.balance:
        return 'balance';
    }
  }

  // Convertit une chaîne JSON en une instance de l'énumération.
  static ExerciseDataCategory fromJson(String json) {
    switch (json) {
      case 'cardio':
        return ExerciseDataCategory.cardio;
      case 'strength':
        return ExerciseDataCategory.strength;
      case 'flexibility':
        return ExerciseDataCategory.flexibility;
      case 'balance':
        return ExerciseDataCategory.balance;
      default:
        throw ArgumentError('Unknown category: $json');
    }
  }
}
