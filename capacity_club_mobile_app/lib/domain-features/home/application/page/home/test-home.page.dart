import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective-training/collective_training_carousel_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/page/unusing-prototype/collective_training_detail_screen.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/widget/calendar/date_time_line_calendar_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/test-auth.screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageTest extends StatefulWidget {
  const HomePageTest({super.key});

  @override
  State<HomePageTest> createState() => _HomePageStateTest();
}

class _HomePageStateTest extends State<HomePageTest> {
  DateTime selectedDay = DateTime.now();
  DateTime today = DateTime.now();
  bool calendarType = false;

  final Color _mainColor = const Color(0xffe77610);
  final Color _tabBarColor = const Color(0xFF15121f);
  final Color _greyColor = const Color(0xff93989b);
  final Color _darkColor = const Color(0xff25232a);

  final bool _isDarkMode = false;

  String timeVal = '08:00';

  int _currentImageSlider = 0;

  Widget _customRadioButton2({value = '08:00'}) {
    final double size = (MediaQuery.of(context).size.width - 64 - (16 * 3)) / 4;

    return GestureDetector(
      onTap: () {
        setState(() {
          timeVal = value;
        });
      },
      child: Container(
        width: size,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: timeVal == value
                ? _mainColor
                : _isDarkMode
                    ? _darkColor
                    : Colors.white),
        child: Center(
            child: Text(value.toString(),
                style: TextStyle(
                    color: timeVal == value
                        ? Colors.white
                        : _isDarkMode
                            ? Colors.white
                            : Colors.black,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  final List<Map<String, dynamic>> workouts = [
    {
      'workoutName': 'Death by Burpees',
      'date': '2024-06-08',
      'startTime': '11:00 AM',
      'endTime': '12:00 PM',
      'totalSlots': 15,
      'registeredSlots': 15,
      'isUserRegistered': true,
    },
    {
      'workoutName': 'Firebreather',
      'date': '2024-06-09',
      'startTime': '9:00 AM',
      'endTime': '10:00 AM',
      'totalSlots': 25,
      'registeredSlots': 5,
      'isUserRegistered': false,
    },
    {
      'workoutName': 'Iron Fist',
      'date': '2024-06-11',
      'startTime': '6:00 AM',
      'endTime': '7:00 AM',
      'totalSlots': 15,
      'registeredSlots': 12,
      'isUserRegistered': true,
    },
    {
      'workoutName': 'Endurance WOD',
      'date': '2024-06-12',
      'startTime': '5:00 PM',
      'endTime': '6:00 PM',
      'totalSlots': 25,
      'registeredSlots': 20,
      'isUserRegistered': false,
    },
    {
      'workoutName': 'Power Hour',
      'date': '2024-06-13',
      'startTime': '8:00 AM',
      'endTime': '9:00 AM',
      'totalSlots': 30,
      'registeredSlots': 25,
      'isUserRegistered': false,
    },
    {
      'workoutName': 'Metcon Madness',
      'date': '2024-06-14',
      'startTime': '4:00 PM',
      'endTime': '5:00 PM',
      'totalSlots': 20,
      'registeredSlots': 10,
      'isUserRegistered': true,
    },
    {
      'workoutName': 'Warrior WOD',
      'date': '2024-06-15',
      'startTime': '9:00 AM',
      'endTime': '10:00 AM',
      'totalSlots': 20,
      'registeredSlots': 15,
      'isUserRegistered': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    void _showDetails(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            child: Center(child: TrainingExample().build(context)),
          );
        },
      );
    }

    return SingleChildScrollView(
        child: Column(
      children: [
        DateTimeLineWithYearSelector(),
        SizedBox(
          height: 20,
        ),
        const Text('COLLECTIVE TRAINING',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        const CollectiveTrainingCarousel(),
        const Divider(),
        const SizedBox(height: 12),
        const Text('INDIVIDUAL TRAINING',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _customRadioButton2(value: '08:00'),
            _customRadioButton2(value: '09:00'),
            _customRadioButton2(value: '10:00'),
            _customRadioButton2(value: '11:00'),
            _customRadioButton2(value: '12:00'),
            _customRadioButton2(value: '13:00'),
            _customRadioButton2(value: '14:00'),
            _customRadioButton2(value: '15:00'),
            _customRadioButton2(value: '16:00'),
            _customRadioButton2(value: '17:00'),
            _customRadioButton2(value: '18:00'),
            _customRadioButton2(value: '19:00'),
          ],
        ),
        const SizedBox(height: 24),
        TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) => _mainColor,
              ),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              )),
              padding: WidgetStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 18)),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Book Now',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ))
      ],
    ));
  }
}
