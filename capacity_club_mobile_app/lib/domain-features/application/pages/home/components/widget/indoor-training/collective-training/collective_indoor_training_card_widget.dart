import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/collective-training/available_label_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/collective-training/card_logo_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/collective-training/icon_with_text_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/collective-training/register_button_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollectiveIndoorTrainingCard extends StatelessWidget {
  final IndoorTrainingEntity indoorTraining;
  final VoidCallback onRegister;
  final VoidCallback onUnregister;

  const CollectiveIndoorTrainingCard({
    super.key,
    required this.indoorTraining,
    required this.onRegister,
    required this.onUnregister,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Text(indoorTraining.title,
                    style: AppTheme.mediumTitleTextStyle),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconWithText(context, FontAwesomeIcons.user,
                    '${indoorTraining.nb_subscription} / ${indoorTraining.nb_place}'),
                iconWithText(context, FontAwesomeIcons.clock,
                    '${indoorTraining.start_hours} - ${indoorTraining.end_hours}'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                availableLabel(context, indoorTraining.nb_place,
                    indoorTraining.nb_subscription),
                SizedBox(width: 5),
                registerButton(context, indoorTraining.is_user_registred,
                    onRegister, onUnregister),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
