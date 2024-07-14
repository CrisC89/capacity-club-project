import 'package:equatable/equatable.dart';

class AddressCreatePayload extends Equatable {
  final String street;
  final String number;
  final String zip_code;
  final String town;
  final String country;
  final String complement;

  AddressCreatePayload({
    required this.street,
    required this.number,
    required this.zip_code,
    required this.town,
    required this.country,
    this.complement = '',
  });

  Map<String, dynamic> toJson() => {
        'street': street,
        'number': number,
        'zip_code': zip_code,
        'town': town,
        'country': country,
        'complement': complement,
      };

  @override
  List<Object?> get props =>
      [street, number, zip_code, town, country, complement];
}
