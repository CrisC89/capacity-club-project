import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme_color.dart';
import 'package:flutter/material.dart';

Widget pageSectionTitle(BuildContext context, String title) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      const Expanded(child: Divider(thickness: 1, color: ThemeColor.dustyGray)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(title.toUpperCase(), style: AppTheme.subTitleTextStyle),
      ),
      const Expanded(child: Divider(thickness: 1)),
    ],
  );
}
