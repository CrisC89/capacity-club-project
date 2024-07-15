import 'package:capacity_club_mobile_app/core/model/abstract/payload.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:equatable/equatable.dart';

class MemberHomeTrainingUpdatePayload extends Equatable implements Payload {
  final UniqueId member_home_training_id;
  final DateTime purchase_date;
  final HomeTrainingModel home_training;
  final MemberModel member;

  const MemberHomeTrainingUpdatePayload({
    required this.member_home_training_id,
    required this.purchase_date,
    required this.home_training,
    required this.member,
  });

  Map<String, dynamic> toJson() => {
        'member_home_training_id': member_home_training_id.toJson(),
        'purchase_date': purchase_date.toIso8601String(),
        'home_training': home_training.toJson(),
        'member': member.toJson(),
      };

  @override
  List<Object?> get props => [
        member_home_training_id,
        purchase_date,
        home_training,
        member,
      ];
}
