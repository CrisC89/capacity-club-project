import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:equatable/equatable.dart';

class AddressUpdatePayload extends Equatable implements Payload {
  final UniqueId address_id;
  final String street;
  final String number;
  final String zipcode;
  final String town;
  final String country;
  final String complement;

  AddressUpdatePayload({
    required this.address_id,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.town,
    required this.country,
    this.complement = '',
  });

  Map<String, dynamic> toJson() => {
        'address_id': address_id,
        'street': street,
        'number': number,
        'zipcode': zipcode,
        'town': town,
        'country': country,
        'complement': complement,
      };

  @override
  List<Object?> get props =>
      [address_id, street, number, zipcode, town, country, complement];
}
