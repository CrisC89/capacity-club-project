import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:equatable/equatable.dart';

class MemberCardCreatePayload extends Equatable implements Payload {
  final int collective_session_count;
  final int individual_session_count;

  const MemberCardCreatePayload({
    required this.collective_session_count,
    required this.individual_session_count,
  });

  Map<String, dynamic> toJson() => {
        'collective_session_count': collective_session_count,
        'individual_session_count': individual_session_count,
      };

  @override
  List<Object?> get props => [
        collective_session_count,
        individual_session_count,
      ];
}
