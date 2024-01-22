import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:flutter/material.dart';

class CollectiveTrainingSessionLoaded extends StatelessWidget {
  const CollectiveTrainingSessionLoaded({super.key, required this.collection});

  final List<CollectiveTrainingSession> collection;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collection.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(collection[index].title),
        );
      },
    );
  }
}
