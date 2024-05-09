import 'package:equatable/equatable.dart';

class CredentialModel extends Equatable {
  final String credential_id;
  final String mail;
  final String googleHash;
  final String facebookHash;
  final bool active;
  final bool isAdmin;

  const CredentialModel(
      {required this.credential_id,
      required this.mail,
      required this.googleHash,
      required this.facebookHash,
      required this.active,
      required this.isAdmin});

  factory CredentialModel.fromJson(Map<String, dynamic> json) {
    return CredentialModel(
        mail: json['mail'],
        googleHash: json['googleHash'] ?? '',
        facebookHash: json['facebookHash'] ?? '',
        credential_id: json['credential_id'],
        active: json['active'],
        isAdmin: json['isAdmin']);
  }

  Map<String, dynamic> toJson() => {
        'mail': mail,
        'googleHash': googleHash,
        'facebookHash': facebookHash,
        'credential_id': credential_id,
        'active': active,
        'isAdmin': isAdmin
      };

  @override
  List<Object?> get props => [];
}
