import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/calendar/date_time_line_calendar_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/coach-info/coach_info_card_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/home_page_section_title_widget.dart';
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

  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);
  final Color _darkColor = const Color(0xff25232a);
  bool _isDarkMode = false;

  String timeVal = '08:00';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DateTimeLineWithYearSelector(),
          SizedBox(height: 20),
          homePageSectionTitle(context, 'COLLECTIVE TRAINING'),
          const SizedBox(height: 16),
          CollectiveIndoorTrainingCarousel(
              indoorTrainings: widget.collectiveIndoorTraining),
          homePageSectionTitle(context, 'INDIVIDUAL TRAINING'),
          const SizedBox(height: 16),
          IndividualIndoorTrainingSection(
              indoorTrainings: widget.individualIndoorTraining),
          const SizedBox(height: 24),
          homePageSectionTitle(context, 'MY DAILY PLAN'),
          const SizedBox(height: 24),
          homePageSectionTitle(context, 'CONTACT US'),
          const SizedBox(height: 24),
          CoachInfoCard(
            name: 'Jehan LECARME',
            description: 'COACH / PRÉPARATION PHYSIQUE / CROSSFIT / HALTÉRO',
            imageUrl: 'assets/img/jl_logo.png',
            email: 'jehan.lecarme@example.com',
            phoneNumber: '+123456789',
          ),
        ],
      ),
    );
  }
}
