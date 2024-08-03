import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:equatable/equatable.dart';

class IndoorTrainingSubscriptionUpdatePayload extends Equatable
    implements Payload {
  final UniqueId indoor_training_subscription_id;
  final DateTime purchased_date;
  final MemberModel? member;
  final IndoorTrainingModel? indoor_training;

  IndoorTrainingSubscriptionUpdatePayload({
    required this.indoor_training_subscription_id,
    required this.purchased_date,
    this.member,
    required this.indoor_training,
  });

  Map<String, dynamic> toJson() {
    return {
      'indoor_training_subscription_id':
          indoor_training_subscription_id.toJson(),
      'purchased_date': purchased_date.toIso8601String(),
      'member': member ?? {},
      'indoor_training': indoor_training ?? {}
    };
  }

  @override
  List<Object?> get props => [
        indoor_training_subscription_id,
        purchased_date,
        member,
        indoor_training,
      ];
}
