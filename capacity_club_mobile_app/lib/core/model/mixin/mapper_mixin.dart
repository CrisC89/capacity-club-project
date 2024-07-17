mixin Mapper<MODEL, ENTITY> {
  ENTITY toEntity();
  MODEL fromEntity(ENTITY model);
  Map<String, dynamic> toJson();
}
