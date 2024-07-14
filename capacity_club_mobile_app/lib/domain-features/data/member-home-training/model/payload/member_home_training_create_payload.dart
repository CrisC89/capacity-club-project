import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:equatable/equatable.dart';

class MemberHomeTrainingCreatePayload extends Equatable {
  final DateTime purchase_date;
  final HomeTrainingModel home_training;
  final MemberModel member;

  const MemberHomeTrainingCreatePayload({
    required this.purchase_date,
    required this.home_training,
    required this.member,
  });

  Map<String, dynamic> toJson() => {
        'purchase_date': purchase_date.toIso8601String(),
        'home_training': home_training.toJson(),
        'member': member.toJson(),
      };

  @override
  List<Object?> get props => [
        purchase_date,
        home_training,
        member,
      ];
}
