import 'package:capacity_club_mobile_app/domain-features/common-features/application/widget/exercise-video-player/exercise_video_player_screen.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/application/widget/youtube-video/youtube_video_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective_training_card.dart';
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

  final List<Map<String, dynamic>> workouts = [
    {
      'workoutName': 'Yoga Class',
      'date': '2024-06-07',
      'startTime': '10:00 AM',
      'endTime': '11:00 AM',
      'totalSlots': 20,
      'registeredSlots': 10,
      'isUserRegistered': false,
    },
    {
      'workoutName': 'HIIT Training',
      'date': '2024-06-08',
      'startTime': '11:00 AM',
      'endTime': '12:00 PM',
      'totalSlots': 15,
      'registeredSlots': 15,
      'isUserRegistered': true,
    },
    {
      'workoutName': 'Pilates Class',
      'date': '2024-06-09',
      'startTime': '9:00 AM',
      'endTime': '10:00 AM',
      'totalSlots': 25,
      'registeredSlots': 5,
      'isUserRegistered': false,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
        ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              final workout = workouts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: WorkoutCard(
                  workoutName: workout['workoutName'],
                  date: workout['date'],
                  startTime: workout['startTime'],
                  endTime: workout['endTime'],
                  totalSlots: workout['totalSlots'],
                  registeredSlots: workout['registeredSlots'],
                  isUserRegistered: workout['isUserRegistered'],
                  onRegister: () {
                    print(
                        'Register button pressed for ${workout['workoutName']}');
                    // Action pour s'inscrire
                  },
                  onUnregister: () {
                    print(
                        'Unregister button pressed for ${workout['workoutName']}');
                    // Action pour se désinscrire
                  },
                  onDetails: () {
                    print(
                        'Details button pressed for ${workout['workoutName']}');
                    // Action pour voir les détails
                  },
                ),
              );
            })
      ],
    );
  }
}

/*

*/
