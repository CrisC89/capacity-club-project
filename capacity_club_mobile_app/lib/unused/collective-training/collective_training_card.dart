import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/widgets/button/custom_icon_button_widget.dart';
import 'package:capacity_club_mobile_app/core/widgets/button/generic_rounded_button_widget.dart';
import 'package:capacity_club_mobile_app/core/widgets/label/genric_label_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/collective-training/card_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        side: BorderSide(color: Color(0xff949494)),
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
                Row(children: [
                  CustomIconButton(icon: FontAwesomeIcons.user),
                  SizedBox(width: 10),
                  Text(
                    '$registeredSlots / $totalSlots',
                    style: AppTheme.dustyGrayMedium16,
                  )
                ]),
                Row(children: [
                  CustomIconButton(icon: FontAwesomeIcons.clock),
                  SizedBox(width: 10),
                  Text(
                    '$startTime - $endTime',
                    style: AppTheme.dustyGrayMedium16,
                  )
                ])
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                (totalSlots - registeredSlots > 0)
                    ? GenericLabel(
                        textColor: Colors.green,
                        backgroundColor: Color.fromARGB(255, 144, 245, 198),
                        text: 'Available')
                    : GenericLabel(
                        textColor: Colors.red,
                        backgroundColor: const Color(0xffffeae9),
                        text: 'full'),
                SizedBox(width: 5),
                isUserRegistered
                    ? GenericRoundedButton(
                        onTap: onUnregister,
                        text: 'Unregister',
                        textColor: Colors.red,
                        backgroundColor: const Color(0xffffeae9),
                      )
                    : GenericRoundedButton(
                        onTap: onRegister,
                        text: 'Register',
                        textColor: Colors.green,
                        backgroundColor: Color.fromARGB(255, 144, 245, 198),
                      )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
