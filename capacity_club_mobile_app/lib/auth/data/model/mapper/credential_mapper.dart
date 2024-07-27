import 'package:capacity_club_mobile_app/auth/data/model/credential_model.dart';
import 'package:capacity_club_mobile_app/auth/domain/entity/credential_entity.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';

class CredentialMapper with Mapper<CredentialModel, CredentialEntity> {
  @override
  CredentialModel fromEntity(CredentialEntity entity) {
    return CredentialModel(
      credential_id: entity.credential_id,
      username: entity.username,
      googleHash: entity.googleHash,
      facebookHash: entity.facebookHash,
      isAdmin: entity.isAdmin,
    );
  }

  @override
  CredentialModel fromJson(Map<String, dynamic> json) {
    // Début de la méthode
    print('ENTER CREDENTIAL FROM JSON');
    print('JSON: $json');
    print('Type of JSON: ${json.runtimeType}');

    // Extraction des valeurs
    final credentialId = json['credential_id'];
    final username = json['username'];
    final googleHash = json['googleHash'];
    final facebookHash = json['facebookHash'];
    final isActive = true;
    final isAdmin = json['isAdmin'];

    // Impression des valeurs et des types
    print('Credential ID: $credentialId');
    print('Type of Credential ID: ${credentialId.runtimeType}');
    print('Username: $username');
    print('Type of Username: ${username.runtimeType}');
    print('Google Hash: $googleHash');
    print('Type of Google Hash: ${googleHash.runtimeType}');
    print('Facebook Hash: $facebookHash');
    print('Type of Facebook Hash: ${facebookHash.runtimeType}');
    print('Is Active: $isActive');
    print('Type of Is Active: ${isActive.runtimeType}');
    print('Is Admin: $isAdmin');
    print('Type of Is Admin: ${isAdmin.runtimeType}');

    // Création de l'objet CredentialModel
    return CredentialModel(
      credential_id: UniqueId.fromJson(credentialId),
      username: username as String,
      googleHash: googleHash as String,
      facebookHash: facebookHash as String,
      isAdmin: isAdmin as bool,
    );
  }

  @override
  CredentialEntity toEntity(CredentialModel model) {
    return CredentialEntity(
      credential_id: model.credential_id,
      username: model.username,
      googleHash: model.googleHash,
      facebookHash: model.facebookHash,
      isAdmin: model.isAdmin,
    );
  }

  @override
  Map<String, dynamic> toJson(CredentialModel model) {
    return {
      'credential_id': model.credential_id.toJson(),
      'username': model.username,
      'googleHash': model.googleHash,
      'facebookHash': model.facebookHash,
      'isAdmin': model.isAdmin,
    };
  }
}
