extension JsonMapExtension on Map<String, dynamic> {
  void addIfNotNull(String key, dynamic value) {
    if (value != null) {
      this[key] = value;
    }
  }
}
