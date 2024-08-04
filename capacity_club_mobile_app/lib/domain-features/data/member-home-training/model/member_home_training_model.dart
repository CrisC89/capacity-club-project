import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/home-training/model/home_training_model.dart';
import 'package:capacity_club_mobile_app/domain-features/data/member-home-training/model/mapper/member_home_training_mapper.dart';
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
    return MemberHomeTrainingMapper.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return MemberHomeTrainingMapper.toJson(this);
  }

  @override
  List<Object?> get props =>
      [member_home_training_id, purchase_date, home_training, member];
}
