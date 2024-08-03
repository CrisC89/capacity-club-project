import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:equatable/equatable.dart';

class IndoorTrainingSubscriptionCreatePayload extends Equatable
    implements Payload {
  final DateTime purchased_date;
  final MemberModel? member;
  final IndoorTrainingModel? indoor_training;

  IndoorTrainingSubscriptionCreatePayload({
    required this.purchased_date,
    this.member,
    required this.indoor_training,
  });

  Map<String, dynamic> toJson() {
    return {
      'purchased_date': purchased_date.toIso8601String(),
      'member': member ?? {},
      'indoor_training': indoor_training ?? {}
    };
  }

  @override
  List<Object?> get props => [
        purchased_date,
        member,
        indoor_training,
      ];
}
