import 'package:capacity_club_mobile_app/domain-features/home/application/widget/expension_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedday = DateTime.now();
  DateTime today = DateTime.now();
  int pageIndex = 0;
  bool isActive = false;
  bool calendarType = false;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionCalender(
          focusedDay: today,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedday = selectedDay;
              today = focusedDay;
            });
          },
          selectedDayPredicate: (day) => isSameDay(today, day),
          onExpansionChanged: (e) {
            setState(() {
              calendarType = !calendarType;
            });
          },
          calendarFormat:
              calendarType ? CalendarFormat.month : CalendarFormat.week,
        ),
      ],
    );
  }
}
