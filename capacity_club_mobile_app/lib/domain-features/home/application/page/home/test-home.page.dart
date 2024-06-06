import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective_training_detail_screen.dart';
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
          TableCalendar(
            focusedDay: today,
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            calendarFormat:
                calendarType ? CalendarFormat.month : CalendarFormat.week,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
              CalendarFormat.week: 'Week',
            },
            onFormatChanged: (format) {
              setState(() {
                calendarType = !calendarType;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                this.selectedDay = selectedDay;
                this.today = focusedDay;
              });
            },
          ),
          SizedBox(height: 16),
          Text(
            'Entraînements du jour',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Container(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                final workout = workouts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
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
                    },
                    onUnregister: () {
                      print(
                          'Unregister button pressed for ${workout['workoutName']}');
                    },
                    onDetails: () {
                      _showDetails(context);
                    },
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 40,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Contact the Coach',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://via.placeholder.com/150'),
                          radius: 40,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Jehan LECARME',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Experienced fitness coach specializing in crossfit and HIIT. Dedicated to helping you achieve your fitness goals.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _sendEmail,
                      icon: Icon(Icons.email),
                      label: Text('Contact via Email'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'coach@example.com',
      queryParameters: {
        'subject': 'Contact',
        'body': 'Hello Coach',
      },
    );

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        throw 'Could not launch $emailLaunchUri';
      }
    } catch (e) {
      // Handle the error appropriately
      print(e.toString());
    }
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
