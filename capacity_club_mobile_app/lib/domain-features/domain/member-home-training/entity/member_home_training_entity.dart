import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/home-training/entity/home_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class MemberHomeTrainingEntity {
  final UniqueId member_home_training_id;
  final DateTime purchase_date;
  final HomeTrainingEntity home_training;
  final MemberEntity member;
  final bool is_empty;
  MemberHomeTrainingEntity(
      {required this.member_home_training_id,
      required this.purchase_date,
      required this.home_training,
      required this.member,
      this.is_empty = false});

  factory MemberHomeTrainingEntity.empty() {
    return MemberHomeTrainingEntity(
        member_home_training_id: UniqueId(''),
        purchase_date: DateTime.now(),
        home_training: HomeTrainingEntity.empty(),
        member: MemberEntity.empty(),
        is_empty: true);
  }
}
