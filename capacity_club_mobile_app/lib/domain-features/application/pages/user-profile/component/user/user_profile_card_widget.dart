import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/component/user/label_value_row_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/member/entity/member_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProfileCard extends StatelessWidget {
  final MemberEntity member;
  final VoidCallback onEdit;

  UserProfileCard({
    super.key,
    required this.member,
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
              child: Text('USER INFORMATION',
                  style: AppTheme.mediumTitleTextStyle),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelValueRow(
                  label: 'Lastname',
                  value: member.lastname,
                ),
                LabelValueRow(
                  label: 'Firstname',
                  value: member.firstname,
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelValueRow(
                  label: 'Sex',
                  value: member.gender.toJson(),
                ),
                LabelValueRow(
                  label: 'Birthdate',
                  value: DateFormat.yMMMd().format(member.birthdate),
                ),
              ],
            ),
            SizedBox(height: 8),
            LabelValueRow(
              label: 'Phone number',
              value: member.phone,
            ),
            SizedBox(height: 8),
            LabelValueRow(
              label: 'Email',
              value: member.mail,
            ),
            SizedBox(height: 8),
            LabelValueRow(
              label: 'Street & Number',
              value: '${member.address.street}, ${member.address.number}',
            ),
            LabelValueRow(
              label: 'Zip Code & Town',
              value: '${member.address.zipcode} ${member.address.town}',
            ),
            LabelValueRow(
              label: 'Country',
              value: member.address.country,
            ),
            if (member.address.complement.isNotEmpty)
              LabelValueRow(
                label: 'Complement',
                value: member.address.complement,
              ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: mainColor),
                  onPressed: onEdit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
