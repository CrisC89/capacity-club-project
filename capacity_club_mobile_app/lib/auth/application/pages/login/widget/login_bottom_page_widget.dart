import 'package:capacity_club_mobile_app/auth/application/pages/login/view_states/login_loaded_view.dart';
import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:capacity_club_mobile_app/common/widgets/basic_ink_well_widget.dart';
import 'package:flutter/cupertino.dart';

loginBottomPage(BuildContext context) {
  return Container(
    padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'local.dontHaveAccount',
          style: AppTheme.dustyGrayMedium16,
        ),
        basicInkWell(
          onTap: () => Navigator.pushNamed(context, '/signUpScreen'),
          child: Text(
            'local.signup',
            style: AppTheme.deepTealBold16,
          ),
        ),
      ],
    ),
  );
}
