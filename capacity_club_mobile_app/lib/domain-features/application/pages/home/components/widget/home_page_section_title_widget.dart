import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:flutter/material.dart';

Widget homePageSectionTitle(BuildContext context, String title) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      const Expanded(child: Divider(thickness: 1)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(title.toUpperCase(), style: AppTheme.subTitleTextStyle),
      ),
      const Expanded(child: Divider(thickness: 1)),
    ],
  );
}
