import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/widgets/text-label/title_text_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/component/user/label_value_row_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member-card/entity/member_card_entity.dart';
import 'package:flutter/material.dart';

class MemberCardView extends StatelessWidget {
  final MemberCardEntity memberCard;
  final VoidCallback onEdit;

  MemberCardView({
    super.key,
    required this.memberCard,
    required this.onEdit,
  });
  final mainColor = Color.fromARGB(255, 4, 136, 183);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        //side: BorderSide(color: Color(0xff949494)),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text('MEMBER CARD', style: AppTheme.mediumTitleTextStyle),
            ),
            SizedBox(height: 8),
            LabelValueRow(
                label: 'Collective Training',
                value: memberCard.collective_session_count.toString()),
            LabelValueRow(
                label: 'Individual Training',
                value: memberCard.individual_session_count.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(
                    'BUY TRAINING',
                    style: TextStyle(
                      fontSize: 16,
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Audiowide',
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            // Ajoutez plus de widgets pour afficher les détails du membre si nécessaire
          ],
        ),
      ),
    );
  }
}
