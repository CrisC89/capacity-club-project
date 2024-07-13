enum ExerciseDataCategory {
  CARDIO('cardio'),
  STRENGTH('strength'),
  FLEXIBILITY('flexibility'),
  BALANCE('balance'),
  ENDURANCE('endurance');

  const ExerciseDataCategory(this.description);

  final String description;

  static String getValue(String category) {
    switch (category.toUpperCase()) {
      case 'CARDIO':
        return ExerciseDataCategory.CARDIO.description;
      case 'STRENGTH':
        return ExerciseDataCategory.STRENGTH.description;
      case 'FLEXIBILITY':
        return ExerciseDataCategory.FLEXIBILITY.description;
      case 'BALANCE':
        return ExerciseDataCategory.BALANCE.description;
      case 'ENDURANCE':
        return ExerciseDataCategory.ENDURANCE.description;
      default:
        throw Exception('ExerciseDataCategory not found');
    }
  }
}
