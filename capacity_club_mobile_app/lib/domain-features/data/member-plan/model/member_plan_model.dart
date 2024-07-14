import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:equatable/equatable.dart';

class MemberPlanModel extends Equatable {
  final UniqueId member_plan_id;
  final String title;
  final String description;
  final int nb_individual_training;
  final int nb_collective_training;
  final double price;
  MemberPlanModel(
      {required this.member_plan_id,
      required this.title,
      required this.description,
      required this.nb_individual_training,
      required this.nb_collective_training,
      required this.price});

  factory MemberPlanModel.fromJson(Map<String, dynamic> json) {
    return MemberPlanModel(
        member_plan_id: json['member_plan_id'],
        title: json['title'],
        description: json['description'],
        nb_individual_training: json['nb_individual_training'],
        nb_collective_training: json['nb_collective_training'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() => {
        'member_plan_id': member_plan_id,
        'title': title,
        'description': description,
        'nb_individual_training': nb_individual_training,
        'nb_collective_training': nb_collective_training,
        'price': price
      };

  @override
  List<Object?> get props => [
        member_plan_id,
        title,
        description,
        nb_individual_training,
        nb_collective_training,
        price
      ];
}
