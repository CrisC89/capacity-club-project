import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';

class AddressEntity {
  final UniqueId address_id;
  final String street;
  final String number;
  final String zip_code;
  final String town;
  final String country;
  final String complement;

  AddressEntity(
      {required this.address_id,
      required this.street,
      required this.number,
      required this.zip_code,
      required this.town,
      required this.country,
      required this.complement});

  factory AddressEntity.empty() {
    return AddressEntity(
        address_id: UniqueId(''),
        street: '',
        number: '',
        zip_code: '',
        town: '',
        country: '',
        complement: '');
  }
}
