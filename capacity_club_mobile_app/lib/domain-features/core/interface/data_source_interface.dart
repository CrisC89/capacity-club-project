import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';

abstract class DataSource<MODEL, CREATE_PAYLOAD, UPDATE_PAYLOAD, FILTER, ID> {
  Future<ApiResponse<List<MODEL>>> getAll();
  Future<ApiResponse<List<MODEL>>> filter(FILTER filter);
  Future<ApiResponse<MODEL>> detail(ID uniqueId);
  Future<ApiResponse<MODEL>> update(UPDATE_PAYLOAD payload);
  Future<ApiResponse<MODEL>> create(CREATE_PAYLOAD payload);
  Future<void> delete(ID uniqueId);
}
