abstract class Mapper<MODEL, ENTITY> {
  MODEL entityToModel(ENTITY entity);
  ENTITY modelToEntity(MODEL model);
}
