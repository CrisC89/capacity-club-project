abstract class Helper<MODEL, ENTITY> {
  MODEL entityToModel(ENTITY entity);
  ENTITY modelToEntity(MODEL model);
}
