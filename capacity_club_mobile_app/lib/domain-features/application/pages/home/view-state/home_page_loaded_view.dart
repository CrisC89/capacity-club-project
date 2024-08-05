import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';

import 'package:capacity_club_mobile_app/domain-features/application/core/page_section_title_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/collective-training/collective_indoor_training_carousel_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/individual-training/individual_indoor_training_section.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:flutter/material.dart';

class HomePageLoadedView extends StatefulWidget {
  HomePageLoadedView(
      {super.key,
      required this.collectiveIndoorTraining,
      required this.individualIndoorTraining});

  final List<IndoorTrainingEntity> collectiveIndoorTraining;
  final List<IndoorTrainingEntity> individualIndoorTraining;

  @override
  _HomePageLoadedViewState createState() => _HomePageLoadedViewState();
}

class _HomePageLoadedViewState extends State<HomePageLoadedView> {
  DateTime selectedDay = DateTime.now();
  DateTime today = DateTime.now();
  bool calendarType = false;

  String timeVal = '08:00';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          pageSectionTitle(context, 'COLLECTIVE TRAINING'),
          const SizedBox(height: 16),
          CollectiveIndoorTrainingCarousel(
              indoorTrainings: widget.collectiveIndoorTraining),
          pageSectionTitle(context, 'INDIVIDUAL TRAINING'),
          const SizedBox(height: 16),
          IndividualIndoorTrainingSection(
              indoorTrainings: widget.individualIndoorTraining),
          const SizedBox(height: 24),
          pageSectionTitle(context, 'MY DAILY PLAN'),
          const SizedBox(height: 24),
          Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Center(
                  child: Text(
                      'Section reserved for current member training, to be implemented.',
                      style: AppTheme.dustyGrayMedium20))),
        ],
      ),
    );
  }
}
