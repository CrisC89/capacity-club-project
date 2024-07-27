import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/widgets/button/custom_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget iconWithText(BuildContext context, IconData icon, String text) {
  return Row(children: [
    CustomIconButton(icon: icon),
    SizedBox(width: 10),
    Text(
      text,
      style: AppTheme.dustyGrayMedium16,
    )
  ]);
}
