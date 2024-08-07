import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/member_plan_model.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-plan/entity/member_plan_entity.dart';

class MemberPlanMapper {
  static MemberPlanModel fromEntity(MemberPlanEntity entity) {
    return MemberPlanModel(
      member_plan_id: entity.member_plan_id,
      title: entity.title,
      description: entity.description,
      nb_individual_training: entity.nb_individual_training,
      nb_collective_training: entity.nb_collective_training,
      price: entity.price,
    );
  }

  static MemberPlanModel fromJson(Map<String, dynamic> json) {
    return MemberPlanModel(
      member_plan_id: json['member_plan_id'] != null
          ? UniqueId.fromJson(json['member_plan_id'])
          : UniqueId(''),
      title: json['title'],
      description: json['description'],
      nb_individual_training: json['nb_individual_training'],
      nb_collective_training: json['nb_collective_training'],
      price: json['price'],
    );
  }

  static MemberPlanEntity toEntity(MemberPlanModel model) {
    return MemberPlanEntity(
        member_plan_id: model.member_plan_id,
        title: model.title,
        description: model.description,
        nb_individual_training: model.nb_individual_training,
        nb_collective_training: model.nb_collective_training,
        price: model.price,
        is_empty: false);
  }

  static Map<String, dynamic> toJson(MemberPlanModel model) {
    return {
      'member_plan_id': model.member_plan_id,
      'title': model.title,
      'description': model.description,
      'nb_individual_training': model.nb_individual_training,
      'nb_collective_training': model.nb_collective_training,
      'price': model.price,
    };
  }
}
