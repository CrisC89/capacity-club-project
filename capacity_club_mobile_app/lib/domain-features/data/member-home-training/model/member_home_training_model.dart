import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member/model/member_model.dart';
import 'package:equatable/equatable.dart';

class MemberHomeTrainingModel extends Equatable {
  final UniqueId member_home_training_id;
  final DateTime purchase_date;
  final HomeTrainingModel? home_training;
  final MemberModel? member;

  MemberHomeTrainingModel(
      {required this.member_home_training_id,
      required this.purchase_date,
      required this.home_training,
      required this.member});

  factory MemberHomeTrainingModel.fromJson(Map<String, dynamic> json) {
    return MemberHomeTrainingModel(
      member_home_training_id: json['member_home_training_id'],
      purchase_date: json['purchase_date'],
      home_training: json['home_training'],
      member: json['member'],
    );
  }

  Map<String, dynamic> toJson() => {
        'member_home_training_id': member_home_training_id,
        'purchase_date': purchase_date,
        'home_training': home_training,
        'member': member
      };

  @override
  List<Object?> get props =>
      [member_home_training_id, purchase_date, home_training, member];
}
