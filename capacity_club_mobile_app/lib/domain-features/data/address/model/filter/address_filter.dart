import 'package:capacity_club_mobile_app/core/model/extension/json_map_extension.dart';

class AddressFilter {
  final String? street;
  final String? number;
  final String? zipcode;
  final String? town;
  final String? country;
  final String? complement;

  AddressFilter({
    this.street,
    this.number,
    this.zipcode,
    this.town,
    this.country,
    this.complement,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    json.addIfNotNull('street', street);
    json.addIfNotNull('number', number);
    json.addIfNotNull('zipcode', zipcode);
    json.addIfNotNull('town', town);
    json.addIfNotNull('country', country);
    json.addIfNotNull('complement', complement);

    return json;
  }
}
