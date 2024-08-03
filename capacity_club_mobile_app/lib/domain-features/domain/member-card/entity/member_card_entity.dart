import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';

class MemberCardEntity {
  final UniqueId member_card_id;
  final int collective_session_count;
  final int individual_session_count;
  final bool is_empty;

  MemberCardEntity(
      {required this.member_card_id,
      required this.collective_session_count,
      required this.individual_session_count,
      this.is_empty = false});

  factory MemberCardEntity.empty() {
    return MemberCardEntity(
        member_card_id: UniqueId(''),
        collective_session_count: 0,
        individual_session_count: 0,
        is_empty: true);
  }
}
