import 'package:capacity_club_mobile_app/core/model/mixin/mapper_mixin.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/mapper/home_training_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/member_home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/mapper/member_mapper.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-home-training/entity/member_home_training_entity.dart';

class MemberHomeTrainingMapper
    with Mapper<MemberHomeTrainingModel, MemberHomeTrainingEntity> {
  @override
  MemberHomeTrainingModel fromEntity(MemberHomeTrainingEntity entity) {
    return MemberHomeTrainingModel(
      member_home_training_id: entity.member_home_training_id,
      purchase_date: entity.purchase_date,
      home_training: HomeTrainingMapper().fromEntity(entity.home_training),
      member: MemberMapper().fromEntity(entity.member),
    );
  }

  @override
  MemberHomeTrainingModel fromJson(Map<String, dynamic> json) {
    return MemberHomeTrainingModel(
      member_home_training_id: json['member_home_training_id'],
      purchase_date: DateTime.parse(json['purchase_date']),
      home_training: HomeTrainingMapper().fromJson(json['home_training']),
      member: MemberMapper().fromJson(json['member']),
    );
  }

  @override
  MemberHomeTrainingEntity toEntity(MemberHomeTrainingModel model) {
    return MemberHomeTrainingEntity(
      member_home_training_id: model.member_home_training_id,
      purchase_date: model.purchase_date,
      home_training: HomeTrainingMapper().toEntity(model.home_training),
      member: MemberMapper().toEntity(model.member),
    );
  }

  @override
  Map<String, dynamic> toJson(MemberHomeTrainingModel model) {
    return {
      'member_home_training_id': model.member_home_training_id,
      'purchase_date': model.purchase_date.toIso8601String(),
      'home_training': HomeTrainingMapper().toJson(model.home_training),
      'member': MemberMapper().toJson(model.member),
    };
  }
}
