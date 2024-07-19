import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/address_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/address/entity/address_entity.dart';

class AddressMapper with Mapper<AddressModel, AddressEntity> {
  @override
  AddressModel fromEntity(AddressEntity entity) {
    return AddressModel(
      address_id: entity.address_id,
      street: entity.street,
      number: entity.number,
      zip_code: entity.zip_code,
      town: entity.town,
      country: entity.country,
      complement: entity.complement,
    );
  }

  @override
  AddressModel fromJson(Map<String, dynamic> json) {
    return AddressModel(
        address_id: UniqueId(json['address_id']),
        street: json['street'],
        number: json['number'],
        zip_code: json['zip_code'],
        town: json['town'],
        country: json['country'],
        complement: json['complement']);
  }

  @override
  AddressEntity toEntity(AddressModel model) {
    return AddressEntity(
      address_id: model.address_id,
      street: model.street,
      number: model.number,
      zip_code: model.zip_code,
      town: model.town,
      country: model.country,
      complement: model.complement,
    );
  }

  @override
  Map<String, dynamic> toJson(AddressModel model) {
    return {
      'address_id': model.address_id.toJson(),
      'street': model.street,
      'number': model.number,
      'zip_code': model.zip_code,
      'town': model.town,
      'country': model.country,
      'complement': model.complement
    };
  }
}
