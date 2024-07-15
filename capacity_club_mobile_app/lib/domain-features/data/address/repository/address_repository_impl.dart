import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:capacity_club_mobile_app/core/model/entities/api_response.dart';
import 'package:capacity_club_mobile_app/core/utils/repository_request_handler.dart';
import 'package:capacity_club_mobile_app/domain-features/core/interface/repository.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/datasource/address_datasource.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/address_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/filter/address_filter.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/payload/address_create_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/payload/address_update_payload.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/address/failure/address_failure.dart';
import 'package:either_dart/either.dart';

class AddressRepositoryImpl
    with
        RepositoryRequestHandler
    implements
        Repository<AddressModel, AddressCreatePayload, AddressUpdatePayload,
            AddressFilter, String> {
  final AddressDatasource addressDataSource;

  AddressRepositoryImpl({required this.addressDataSource});

  @override
  Future<Either<Failure, ApiResponse<AddressModel>>> detail(
      String uniqueId) async {
    return repositoryHandleRequest(
      () => addressDataSource.detail(uniqueId),
      AddressNotFoundFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<AddressModel>>>> filter(
      AddressFilter filter) async {
    return repositoryHandleRequest(
      () => addressDataSource.filter(filter),
      AddressFilterFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<AddressModel>>> update(
      AddressUpdatePayload payload) async {
    return repositoryHandleRequest(
      () => addressDataSource.update(payload),
      AddressUpdateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<AddressModel>>> create(
      AddressCreatePayload payload) async {
    return repositoryHandleRequest(
      () => addressDataSource.create(payload),
      AddressCreateFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<void>>> delete(String uniqueId) async {
    return repositoryHandleRequest(
      () => addressDataSource.delete(uniqueId),
      AddressDeleteFailure(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<AddressModel>>>> getAll() async {
    return repositoryHandleRequest(
      () => addressDataSource.getAll(),
      AddressListFailure(),
    );
  }
}
