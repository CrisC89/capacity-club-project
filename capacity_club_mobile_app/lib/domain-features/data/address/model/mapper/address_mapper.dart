import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/address_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/address/entity/address_entity.dart';

class AddressMapper {
  static AddressModel fromEntity(AddressEntity entity) {
    return AddressModel(
      address_id: entity.address_id,
      street: entity.street,
      number: entity.number,
      zipcode: entity.zipcode,
      town: entity.town,
      country: entity.country,
      complement: entity.complement,
    );
  }

  static AddressModel fromJson(Map<String, dynamic> json) {
    return AddressModel(
        address_id: json['address_id'] != null
            ? UniqueId.fromJson(json['address_id'])
            : UniqueId(''),
        street: json['street'],
        number: json['number'],
        zipcode: json['zipcode'],
        town: json['town'],
        country: json['country'],
        complement: json['complement']);
  }

  static AddressEntity toEntity(AddressModel model) {
    return AddressEntity(
        address_id: model.address_id,
        street: model.street,
        number: model.number,
        zipcode: model.zipcode,
        town: model.town,
        country: model.country,
        complement: model.complement,
        is_empty: false);
  }

  static Map<String, dynamic> toJson(AddressModel model) {
    return {
      'address_id': model.address_id.toJson(),
      'street': model.street,
      'number': model.number,
      'zipcode': model.zipcode,
      'town': model.town,
      'country': model.country,
      'complement': model.complement
    };
  }
}
