mixin Mapper<MODEL, ENTITY> {
  ENTITY toEntity(MODEL model);
  MODEL fromEntity(ENTITY entity);
  Map<String, dynamic> toJson(MODEL model);
  MODEL fromJson(Map<String, dynamic> json);
}
