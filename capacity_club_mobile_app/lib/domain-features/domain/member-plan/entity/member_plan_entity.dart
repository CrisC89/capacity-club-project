import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';

class MemberPlanEntity {
  final UniqueId member_plan_id;
  final String title;
  final String description;
  final int nb_individual_training;
  final int nb_collective_training;
  final double price;
  final bool is_empty;
  MemberPlanEntity(
      {required this.member_plan_id,
      required this.title,
      required this.description,
      required this.nb_individual_training,
      required this.nb_collective_training,
      required this.price,
      this.is_empty = false});

  factory MemberPlanEntity.empty() {
    return MemberPlanEntity(
        member_plan_id: UniqueId(''),
        title: '',
        description: '',
        nb_individual_training: 0,
        nb_collective_training: 0,
        price: 0,
        is_empty: true);
  }
}
