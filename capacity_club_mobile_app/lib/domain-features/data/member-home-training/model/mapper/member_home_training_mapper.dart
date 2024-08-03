import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/mapper/home_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/member_home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/mapper/member_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/home-training/entity/home_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-home-training/entity/member_home_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class MemberHomeTrainingMapper
    with Mapper<MemberHomeTrainingModel, MemberHomeTrainingEntity> {
  @override
  MemberHomeTrainingModel fromEntity(MemberHomeTrainingEntity entity) {
    return MemberHomeTrainingModel(
      member_home_training_id: entity.member_home_training_id,
      purchase_date: entity.purchase_date,
      home_training: entity.home_training.is_empty
          ? null
          : HomeTrainingMapper().fromEntity(entity.home_training),
      member: entity.member.is_empty
          ? null
          : MemberMapper().fromEntity(entity.member),
    );
  }

  @override
  MemberHomeTrainingModel fromJson(Map<String, dynamic> json) {
    return MemberHomeTrainingModel(
      member_home_training_id: json['member_home_training_id'] != null
          ? UniqueId.fromJson(json['member_home_training_id'])
          : UniqueId(''),
      purchase_date: json['purchase_date'] != null
          ? DateTime.parse(json['purchase_date'])
          : DateTime.now(),
      home_training: json['home_training'] != null
          ? HomeTrainingMapper().fromJson(json['home_training'])
          : null,
      member: json['member'] != null
          ? MemberMapper().fromJson(json['member'])
          : null,
    );
  }

  @override
  MemberHomeTrainingEntity toEntity(MemberHomeTrainingModel model) {
    return MemberHomeTrainingEntity(
        member_home_training_id: model.member_home_training_id,
        purchase_date: model.purchase_date,
        home_training: model.home_training != null
            ? HomeTrainingMapper().toEntity(model.home_training!)
            : HomeTrainingEntity.empty(),
        member: model.member != null
            ? MemberMapper().toEntity(model.member!)
            : MemberEntity.empty(),
        is_empty: false);
  }

  @override
  Map<String, dynamic> toJson(MemberHomeTrainingModel model) {
    return {
      'member_home_training_id': model.member_home_training_id,
      'purchase_date': model.purchase_date.toIso8601String(),
      'home_training': model.home_training != null
          ? HomeTrainingMapper().toJson(model.home_training!)
          : {},
      'member':
          model.member != null ? MemberMapper().toJson(model.member!) : {},
    };
  }
}
