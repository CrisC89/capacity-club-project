import 'package:capacity_club_mobile_app/core/config/i18n/app_local.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/widgets/button/basic_ink_well_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';

Widget RegisterBottomPage(BuildContext context) {
  return Container(
    padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocale.already_have_account.getString(context),
          style: AppTheme.dustyGrayMedium16,
        ),
        const Text(' '),
        basicInkWell(
          onTap: () => GoRouter.of(context).go('/login'),
          child: Text(
            AppLocale.sign_in.getString(context),
            style: AppTheme.deepTealBold16,
          ),
        ),
      ],
    ),
  );
}
