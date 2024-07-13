class UniqueId {
  final String unique_id;

  const UniqueId(this.unique_id);

  factory UniqueId.fromJson(Map<String, dynamic> json) {
    print("UNIQUE ID");
    print(json['unique_id']);
    return UniqueId(
      json['unique_id'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'unique_id': unique_id,
      };
}
