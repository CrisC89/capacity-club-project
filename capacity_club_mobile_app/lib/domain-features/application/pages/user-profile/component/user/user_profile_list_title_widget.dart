import 'package:capacity_club_mobile_app/core/config/theme/constant_size.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileListTitle extends StatelessWidget {
  UserProfileListTitle({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  final mainColor = Color.fromARGB(255, 4, 136, 183);

  @override
  Widget build(BuildContext context) {
    var isDark = false;
    var iconColor = isDark ? mainColor : mainColor;

    return Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Color(0xff949494)),
        ),
        child: ListTile(
          onTap: onPress,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(tBorderRadius),
              color: iconColor.withOpacity(0.1),
            ),
            child: Icon(icon, color: iconColor),
          ),
          title: Text(title.toUpperCase(), style: AppTheme.subTitleTextStyle),
          trailing: endIcon
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(FontAwesomeIcons.angleRight,
                      size: 18.0, color: Colors.grey))
              : null,
        ));
  }
}
