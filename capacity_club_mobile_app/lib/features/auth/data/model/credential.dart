class Credential {
  final String credential_id;
  final String mail;
  final String googleHash;
  final String facebookHash;
  final bool active;
  final bool isAdmin;

  const Credential(
      {required this.credential_id,
      required this.mail,
      required this.googleHash,
      required this.facebookHash,
      required this.active,
      required this.isAdmin});

  factory Credential.fromJson(Map<String, dynamic> json) {
    return Credential(
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
}
