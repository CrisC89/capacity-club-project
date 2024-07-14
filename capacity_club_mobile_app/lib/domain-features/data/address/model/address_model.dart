import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final UniqueId address_id;
  final String street;
  final String number;
  final String zip_code;
  final String town;
  final String country;
  final String complement;

  AddressModel(
      {required this.address_id,
      required this.street,
      required this.number,
      required this.zip_code,
      required this.town,
      required this.country,
      String? complement})
      : complement = complement ?? '';

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        address_id: json['address_id'],
        street: json['street'],
        number: json['number'],
        zip_code: json['zip_code'],
        town: json['town'],
        country: json['country'],
        complement: json['complement']);
  }

  Map<String, dynamic> toJson() => {
        'address_id': address_id,
        'street': street,
        'number': number,
        'zip_code': zip_code,
        'town': town,
        'country': country,
        'complement': complement
      };

  @override
  List<Object?> get props =>
      [address_id, street, number, zip_code, town, country];
}
