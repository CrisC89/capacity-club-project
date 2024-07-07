import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective-training/card_logo_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective-training/label/available_label_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective-training/label/complet_label_widget.dart';
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
    return Expanded(
        child: Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
            color: Color(0xff949494)), // Définir la couleur de la bordure ici
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: cardLogo(context)),
                SizedBox(width: 10),
                Text(workoutName, style: AppTheme.mediumTitleTextStyle),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Slot: $registeredSlots / $totalSlots',
                  style: AppTheme.dustyGrayMedium16,
                ),
                SizedBox(width: 15),
                Text(
                  'Time: $startTime - $endTime',
                  style: AppTheme.dustyGrayMedium16,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                (totalSlots - registeredSlots > 0)
                    ? availableLabel()
                    : fullLabel(),
                SizedBox(width: 5),
                isUserRegistered
                    ? ElevatedButton(
                        onPressed: onUnregister,
                        child: Text('Unregister'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                      )
                    : ElevatedButton(
                        onPressed: onRegister,
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green,
                        ),
                      )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
