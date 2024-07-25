import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:flutter/material.dart';

class TestPageLoaded extends StatelessWidget {
  const TestPageLoaded({super.key, required this.indoorTrainingList});

  final List<Map<String, dynamic>> indoorTrainingList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: indoorTrainingList.length,
      itemBuilder: (context, index) {
        final item = indoorTrainingList[index];
        return ListTile(
          tileColor: Colors.white,
          onTap: () => debugPrint(item['workoutName']),
          leading: const Icon(Icons.circle),
          title: Text(item['workoutName']),
        );
      },
    );
  }
}
