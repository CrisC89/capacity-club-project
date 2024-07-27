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
  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);
  final Color _darkColor = const Color(0xff25232a);
  bool _isDarkMode = false;

  String timeVal = '08:00';
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
