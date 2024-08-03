import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/indoor-training/model/indoor_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:equatable/equatable.dart';

class IndoorTrainingSubscriptionModel extends Equatable {
  final UniqueId indoor_training_subscription_id;
  final DateTime purchased_date;
  final MemberModel? member;
  final IndoorTrainingModel indoor_training;

  const IndoorTrainingSubscriptionModel(
      {required this.indoor_training_subscription_id,
      required this.purchased_date,
      required this.member,
      required this.indoor_training});
/*
  factory IndoorTrainingSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return IndoorTrainingMapper().fromJson(json);
  }*/

  Map<String, dynamic> toJson() => {
        'indoor_training_subscription_id': indoor_training_subscription_id,
      };

  @override
  List<Object?> get props => [
        indoor_training_subscription_id,
      ];
}
