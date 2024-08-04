import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-plan/model/mapper/member_plan_mapper.dart';
import 'package:equatable/equatable.dart';

class MemberPlanModel extends Equatable {
  final UniqueId member_plan_id;
  final String title;
  final String description;
  final int nb_individual_training;
  final int nb_collective_training;
  final double price;

  MemberPlanModel(
      {required this.member_plan_id,
      required this.title,
      required this.description,
      required this.nb_individual_training,
      required this.nb_collective_training,
      required this.price});

  factory MemberPlanModel.fromJson(Map<String, dynamic> json) {
    return MemberPlanMapper.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return MemberPlanMapper.toJson(this);
  }

  @override
  List<Object?> get props => [
        member_plan_id,
        title,
        description,
        nb_individual_training,
        nb_collective_training,
        price
      ];
}
