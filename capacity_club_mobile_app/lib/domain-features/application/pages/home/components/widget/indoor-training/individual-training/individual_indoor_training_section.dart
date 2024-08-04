import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/individual-training/book_individual_indoor_training_button_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/individual-training/individual_indoor_training_button_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:flutter/material.dart';

class IndividualIndoorTrainingSection extends StatefulWidget {
  final List<IndoorTrainingEntity> indoorTrainings;

  const IndividualIndoorTrainingSection(
      {super.key, required this.indoorTrainings});

  @override
  State<IndividualIndoorTrainingSection> createState() =>
      _IndividualIndoorTrainingSectionState();
}

class _IndividualIndoorTrainingSectionState
    extends State<IndividualIndoorTrainingSection> {
  String timeVal = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 1.0, // Ajustez l'élévation selon vos besoins
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: widget.indoorTrainings.map<Widget>((training) {
                return individualIndoorTrainingButton(
                  context,
                  training.start_hours,
                  timeVal,
                  () {
                    setState(() {
                      timeVal = training.start_hours;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            bookIndividualIndoorTrainingButton(() {}),
          ],
        ),
      ),
    );
  }
}
