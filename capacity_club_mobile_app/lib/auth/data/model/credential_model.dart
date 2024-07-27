import 'dart:convert';

import 'package:capacity_club_mobile_app/auth/data/model/mapper/credential_mapper.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:equatable/equatable.dart';

class CredentialModel extends Equatable {
  final UniqueId credential_id;
  final String username;
  final String googleHash;
  final String facebookHash;
  final bool isAdmin;

  const CredentialModel(
      {required this.credential_id,
      required this.username,
      required this.googleHash,
      required this.facebookHash,
      required this.isAdmin});

  factory CredentialModel.fromJson(Map<String, dynamic> json) {
    print('ENTER CREDENTIAL FROM JSON');
    return CredentialMapper().fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return CredentialMapper().toJson(this);
  }

  @override
  List<Object?> get props => [];
}
