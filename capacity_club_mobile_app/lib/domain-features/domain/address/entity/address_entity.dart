import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';

class AddressEntity {
  final UniqueId address_id;
  final String street;
  final String number;
  final String zipcode;
  final String town;
  final String country;
  final String complement;
  final bool is_empty;

  AddressEntity(
      {required this.address_id,
      required this.street,
      required this.number,
      required this.zipcode,
      required this.town,
      required this.country,
      required this.complement,
      required this.is_empty});

  factory AddressEntity.empty() {
    return AddressEntity(
        address_id: UniqueId(''),
        street: '',
        number: '',
        zipcode: '',
        town: '',
        country: '',
        complement: '',
        is_empty: true);
  }
}
