import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/address/model/mapper/address_mapper.dart';
import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final UniqueId address_id;
  final String street;
  final String number;
  final String zipcode;
  final String town;
  final String country;
  final String complement;

  AddressModel(
      {required this.address_id,
      required this.street,
      required this.number,
      required this.zipcode,
      required this.town,
      required this.country,
      String? complement})
      : complement = complement ?? '';

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressMapper().fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return AddressMapper().toJson(this);
  }

  @override
  List<Object?> get props =>
      [address_id, street, number, zipcode, town, country];
}
