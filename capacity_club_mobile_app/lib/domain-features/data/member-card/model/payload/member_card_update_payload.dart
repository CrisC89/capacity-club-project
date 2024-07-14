import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:equatable/equatable.dart';

class MemberCardUpdatePayload extends Equatable {
  final UniqueId member_card_id;
  final int collective_session_count;
  final int individual_session_count;

  const MemberCardUpdatePayload({
    required this.member_card_id,
    required this.collective_session_count,
    required this.individual_session_count,
  });

  Map<String, dynamic> toJson() => {
        'member_card_id': member_card_id.toJson(),
        'collective_session_count': collective_session_count,
        'individual_session_count': individual_session_count,
      };

  @override
  List<Object?> get props => [
        member_card_id,
        collective_session_count,
        individual_session_count,
      ];
}
