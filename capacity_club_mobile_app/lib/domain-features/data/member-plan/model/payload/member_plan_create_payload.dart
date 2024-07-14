import 'package:equatable/equatable.dart';

class MemberPlanCreatePayload extends Equatable {
  final String title;
  final String description;
  final int nb_individual_training;
  final int nb_collective_training;
  final double price;

  const MemberPlanCreatePayload({
    required this.title,
    required this.description,
    required this.nb_individual_training,
    required this.nb_collective_training,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'nb_individual_training': nb_individual_training,
        'nb_collective_training': nb_collective_training,
        'price': price,
      };

  @override
  List<Object?> get props => [
        title,
        description,
        nb_individual_training,
        nb_collective_training,
        price,
      ];
}
