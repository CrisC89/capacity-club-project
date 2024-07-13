import 'package:capacity_club_mobile_app/core/widgets/app_logo_widget.dart';
import 'package:capacity_club_mobile_app/core/widgets/text-label/title_text_widget.dart';
import 'package:flutter/cupertino.dart';

Widget AuthLogo(BuildContext context, String title) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.33,
    child: Column(
      children: [
        const Spacer(),
        appLogo(context),
        titleText(title),
        const Padding(padding: EdgeInsets.only(top: 20)),
      ],
    ),
  );
}
