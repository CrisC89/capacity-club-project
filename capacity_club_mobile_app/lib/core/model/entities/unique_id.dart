class UniqueId {
  final String unique_id;

  const UniqueId(this.unique_id);

  factory UniqueId.fromJson(dynamic json) {
    if (json is String) {
      //final decodedJson = jsonDecode(json);
      return UniqueId(json);
      //return UniqueId(decodedJson['unique_id'] as String);
    } else if (json is Map<String, dynamic>) {
      return UniqueId(json['unique_id'] as String);
    } else {
      throw Exception("Invalid JSON format for UniqueId");
    }
  }
  /* factory UniqueId.fromJson(Map<String, dynamic> json) {
    print("UNIQUE ID");
    print(json['unique_id']);
    return UniqueId(
      json['unique_id'] as String,
    );
  }*/

  Map<String, dynamic> toJson() => {
        'unique_id': unique_id,
      };
}
