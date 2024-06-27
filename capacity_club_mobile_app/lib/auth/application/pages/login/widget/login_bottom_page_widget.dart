import 'package:capacity_club_mobile_app/auth/application/pages/login/view_states/login_loaded_view.dart';
import 'package:capacity_club_mobile_app/common/i18n/app_local.dart';
import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:capacity_club_mobile_app/common/widgets/button/basic_ink_well_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';

loginBottomPage(BuildContext context) {
  return Container(
    padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocale.dont_have_account.getString(context),
          style: AppTheme.dustyGrayMedium16,
        ),
        const Text(' '),
        basicInkWell(
          onTap: () => Navigator.pushNamed(context, '/signUpScreen'),
          child: Text(
            AppLocale.sign_up.getString(context),
            style: AppTheme.deepTealBold16,
          ),
        ),
      ],
    ),
  );
}
