import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:equatable/equatable.dart';

class AddressCreatePayload extends Equatable implements Payload {
  final String street;
  final String number;
  final String zipcode;
  final String town;
  final String country;
  final String complement;

  AddressCreatePayload({
    required this.street,
    required this.number,
    required this.zipcode,
    required this.town,
    required this.country,
    this.complement = '',
  });

  Map<String, dynamic> toJson() => {
        'street': street,
        'number': number,
        'zipcode': zipcode,
        'town': town,
        'country': country,
        'complement': complement,
      };

  @override
  List<Object?> get props =>
      [street, number, zipcode, town, country, complement];
}
