import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/utils/page_config.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/coach_info_card_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/collective-training/collective_training_carousel_widget.dart';
import 'package:capacity_club_mobile_app/unused/collective_training_detail_screen.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/calendar/date_time_line_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.house, name: 'home', child: HomePage2());
  @override
  State<HomePage2> createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  DateTime selectedDay = DateTime.now();
  DateTime today = DateTime.now();
  bool calendarType = false;

  final Color _mainColorBack = const Color(0xffe77610);

  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);
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
                style: timeVal == value
                    ? AppTheme.whiteTypeMedium16
                    : AppTheme.dustyGrayMedium16)),
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
        child: Expanded(
      child: Column(
        children: [
          DateTimeLineWithYearSelector(),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisSize: MainAxisSize.max, children: [
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const Text('COLLECTIVE TRAINING',
                  style: AppTheme.subTitleTextStyle),
            ),
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
          ]),
          const SizedBox(height: 16),
          const CollectiveTrainingCarousel(),
          Row(mainAxisSize: MainAxisSize.max, children: [
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const Text('INDIVIDUAL TRAINING',
                  style: AppTheme.subTitleTextStyle),
            ),
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
          ]),
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
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Book Now',
                  style: AppTheme.whiteTypeMedium14,
                  textAlign: TextAlign.center,
                ),
              )),
          const SizedBox(height: 24),
          Row(mainAxisSize: MainAxisSize.max, children: [
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child:
                  const Text('CONTACT US', style: AppTheme.subTitleTextStyle),
            ),
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
          ]),
          const SizedBox(height: 24),
          CoachInfoCard(
            name: 'Jehan LECARME',
            description: 'COACH / PRÉPARATION PHYSIQUE / CROSSFIT / HALTÉRO',
            imageUrl: 'assets/img/jl_logo.png',
            email: 'jehan.lecarme@example.com',
            phoneNumber: '+123456789',
          )
        ],
      ),
    ));
  }
}
