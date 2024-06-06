import 'package:flutter/material.dart';

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
          children: <Widget>[
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
                if (!isUserRegistered && totalSlots - registeredSlots > 0)
                  ElevatedButton(
                    onPressed: onRegister,
                    child: Text('Register'),
                  ),
                if (isUserRegistered)
                  ElevatedButton(
                    onPressed: onUnregister,
                    child: Text('Unregister'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
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
