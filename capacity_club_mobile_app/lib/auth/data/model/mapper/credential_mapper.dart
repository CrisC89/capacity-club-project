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
      isActive: entity.isActive,
      isAdmin: entity.isAdmin,
    );
  }

  @override
  CredentialModel fromJson(Map<String, dynamic> json) {
    return CredentialModel(
      credential_id: UniqueId(json['credential_id']),
      username: json['username'],
      googleHash: json['googleHash'],
      facebookHash: json['facebookHash'],
      isActive: json['isActive'],
      isAdmin: json['isAdmin'],
    );
  }

  @override
  CredentialEntity toEntity(CredentialModel model) {
    return CredentialEntity(
      credential_id: model.credential_id,
      username: model.username,
      googleHash: model.googleHash,
      facebookHash: model.facebookHash,
      isActive: model.isActive,
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
      'isActive': model.isActive,
      'isAdmin': model.isAdmin,
    };
  }
}
