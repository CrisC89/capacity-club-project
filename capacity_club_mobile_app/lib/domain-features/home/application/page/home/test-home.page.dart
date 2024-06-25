import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective_training_carousel_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective_training_detail_screen.dart';
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

class WorkoutCard extends StatelessWidget {
  final String workoutName;
  final String date;
  final String startTime;
  final String endTime;
  final int totalSlots;
  final int registeredSlots;
  final bool isUserRegistered;
  final VoidCallback onRegister;
  final VoidCallback onUnregister;
  final VoidCallback onDetails;

  const WorkoutCard({
    Key? key,
    required this.workoutName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.totalSlots,
    required this.registeredSlots,
    required this.isUserRegistered,
    required this.onRegister,
    required this.onUnregister,
    required this.onDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Logo de l'entreprise
            Center(
                child: Image.asset('assets/img/icon_logo_v2.png', width: 200)),
            SizedBox(height: 16),
            Text(
              workoutName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Date: $date',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Time: $startTime - $endTime',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Slots: $registeredSlots / $totalSlots',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                if (totalSlots - registeredSlots > 0)
                  Text(
                    'Available',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  )
                else
                  Text(
                    'Full',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (isUserRegistered)
                  ElevatedButton(
                    onPressed: onUnregister,
                    child: Text('Unregister'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                  ),
                if (!isUserRegistered)
                  ElevatedButton(
                    onPressed: onRegister,
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green,
                    ),
                  ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onDetails,
                  child: Text('Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
