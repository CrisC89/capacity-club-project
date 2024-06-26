import 'dart:convert';

import 'package:capacity_club_mobile_app/common/model/unique_id.dart';
import 'package:equatable/equatable.dart';

class CredentialModel extends Equatable {
  final UniqueId credential_id;
  final String username;
  final String googleHash;
  final String facebookHash;
  final bool isActive;
  final bool isAdmin;

  const CredentialModel(
      {required this.credential_id,
      required this.username,
      required this.googleHash,
      required this.facebookHash,
      required this.isActive,
      required this.isAdmin});

  factory CredentialModel.fromJson(Map<String, dynamic> json) {
    print('json');
    print(json);
    print('Type of data: ${json.runtimeType}');
    print('credential_id');
    print(json['credential_id']);
    print('Type of data: ${json['credential_id'].runtimeType}');
    print('Active');
    print(json['isActive']);
    print('Type of data: ${json['active'].runtimeType}');

    print('Admin');
    print(json['isAdmin']);
    print('Type of data: ${json['isAdmin'].runtimeType}');
    return CredentialModel(
        username: json['username'],
        googleHash: json['googleHash'] ?? '',
        facebookHash: json['facebookHash'] ?? '',
        credential_id: UniqueId(json['credential_id']),
        isActive: json['isActive'] ?? true,
        isAdmin: json['isAdmin']);
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'googleHash': googleHash,
        'facebookHash': facebookHash,
        'credential_id': credential_id.toJson(),
        'isActive': isActive,
        'isAdmin': isAdmin
      };

  @override
  List<Object?> get props => [];
}
