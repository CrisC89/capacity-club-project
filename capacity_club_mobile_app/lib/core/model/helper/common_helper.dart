class CommonHelperMethod {
  static bool jsonContainsAndNotNullKey(Map<String, dynamic> json, String key) {
    return json.containsKey(key) && json[key] != null;
  }
}
