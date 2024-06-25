import 'package:capacity_club_mobile_app/domain-features/home/application/page/home/fake_data.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective_training_detail_screen.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/widget/date_time_line_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  late List<Map<String, dynamic>> individualSlots;

  @override
  void initState() {
    individualSlots = individual_slots_data;
    super.initState();
  }

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
          DateTimeLineCalendar(),
          SizedBox(height: 4),
          Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 4),
          Text(
            'Entraînements du jour',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Container(
            height: 300, // Adjusted height for collective training cards
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
                      setState(() {
                        workout['isUserRegistered'] = true;
                        workout['registeredSlots'] += 1;
                      });
                    },
                    onUnregister: () {
                      setState(() {
                        workout['isUserRegistered'] = false;
                        workout['registeredSlots'] -= 1;
                      });
                    },
                    onDetails: () {
                      _showDetails(context);
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8),
          Divider(
            height: 40,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 8),
          Text(
            'Créneaux séances individuels',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Container(
            height: 400, // Adjust the height as needed
            child: SingleChildScrollView(
              child: Column(
                children: individualSlots.map((slot) {
                  return Column(
                    children: [
                      IndividualSlotCard(
                        time: slot['time'],
                        isAvailable: slot['isAvailable'],
                        isUserRegistered: slot['isUserRegistered'] ?? false,
                        onBook: () {
                          setState(() {
                            slot['isUserRegistered'] = true;
                            slot['isAvailable'] = false;
                          });
                        },
                        onCancel: () {
                          setState(() {
                            slot['isUserRegistered'] = false;
                            slot['isAvailable'] = true;
                          });
                        },
                      ),
                      Divider(
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
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
        width: MediaQuery.of(context).size.width *
            0.8, // Reduced width for collective training cards
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Logo de l'entreprise
            Center(
                child: Image.asset('assets/img/icon_logo_v2.png',
                    width: 50)), // Reduced logo size
            SizedBox(height: 4),
            Text(
              workoutName,
              style: TextStyle(
                fontSize: 20, // Reduced font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Date: $date',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Time: $startTime - $endTime',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Slots: $registeredSlots / $totalSlots',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                if (totalSlots - registeredSlots > 0)
                  Text(
                    'Disponible',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  )
                else
                  Text(
                    'Complet',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (isUserRegistered)
                  ElevatedButton(
                    onPressed: onUnregister,
                    child: Text('Annuler'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                  ),
                if (!isUserRegistered)
                  ElevatedButton(
                    onPressed: onRegister,
                    child: Text('Réserver'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green,
                    ),
                  ),
                SizedBox(width: 4),
                ElevatedButton(
                  onPressed: onDetails,
                  child: Text('Détails'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IndividualSlotCard extends StatelessWidget {
  final String time;
  final bool isAvailable;
  final bool isUserRegistered;
  final VoidCallback onBook;
  final VoidCallback onCancel;

  const IndividualSlotCard({
    Key? key,
    required this.time,
    required this.isAvailable,
    required this.isUserRegistered,
    required this.onBook,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              time,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            if (isUserRegistered)
              ElevatedButton(
                onPressed: onCancel,
                child: Text('Annuler réservation'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
              )
            else if (isAvailable)
              ElevatedButton(
                  onPressed: onBook,
                  child: Text('Réserver'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green,
                  ))
            else
              Text(
                'Indisponible',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
