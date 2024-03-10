export interface CrudService<
  ENTITY,
  CREATE_PAYLOAD,
  UPDATE_PAYLOAD,
  FILTER,
  ID,
> {
  getAll(): Promise<ENTITY[]>;

  filter(filter: FILTER): Promise<ENTITY[]>;

  detail(id: ID): Promise<ENTITY>;

  create(payload: CREATE_PAYLOAD): Promise<ENTITY>;

  update(payload: UPDATE_PAYLOAD): Promise<ENTITY>;

  delete(id: ID): Promise<void>;
}
