import 'package:capacity_club_mobile_app/core/widgets/button/generic_rounded_button_widget.dart';
import 'package:flutter/material.dart';

Widget registerButton(BuildContext context, bool is_user_registred,
    VoidCallback onRegister, VoidCallback onUnregister) {
  return is_user_registred
      ? GenericRoundedButton(
          onTap: onUnregister,
          text: 'Unregister',
          textColor: Colors.red,
          backgroundColor: const Color(0xffffeae9),
        )
      : GenericRoundedButton(
          onTap: onRegister,
          text: 'Register',
          textColor: Colors.green,
          backgroundColor: Color.fromARGB(255, 144, 245, 198),
        );
}
