import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-card/model/mapper/member_card_mapper.dart';
import 'package:equatable/equatable.dart';

class MemberCardModel extends Equatable {
  final UniqueId member_card_id;
  final int collective_session_count;
  final int individual_session_count;

  const MemberCardModel(
      {required this.member_card_id,
      required this.collective_session_count,
      required this.individual_session_count});

  factory MemberCardModel.fromJson(Map<String, dynamic> json) {
    return MemberCardMapper.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return MemberCardMapper.toJson(this);
  }

  @override
  List<Object?> get props => [
        member_card_id,
      ];
}
