import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';

class IndoorTrainingSubcriptionEntity {
  final UniqueId indoor_training_subscription_id;
  final DateTime purchased_date;
  final MemberEntity member;
  final IndoorTrainingEntity indoor_training;
  final bool is_empty;

  IndoorTrainingSubcriptionEntity(
      {required this.indoor_training_subscription_id,
      required this.purchased_date,
      required this.member,
      required this.indoor_training,
      this.is_empty = false});

  factory IndoorTrainingSubcriptionEntity.empty() {
    return IndoorTrainingSubcriptionEntity(
        indoor_training_subscription_id: UniqueId(''),
        purchased_date: DateTime.now(),
        member: MemberEntity.empty(),
        indoor_training: IndoorTrainingEntity.empty(),
        is_empty: true);
  }
}
