import 'package:capacity_club_mobile_app/common/config/snack_bar_key.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

errorSnackBar(String text) {
  final snackbar = SnackBar(
    content: Row(
      children: [
        Icon(
          FontAwesomeIcons.exclamation,
          color: Colors.white,
        ),
        const Padding(padding: EdgeInsets.only(left: 20)),
        Text(text.toUpperCase(),
            style: TextStyle(
                fontFamily: 'Titillium',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14)),
      ],
    ),
    padding: const EdgeInsets.all(20),
    backgroundColor: Colors.red,
  );
  // ScaffoldMessenger.of(context).showSnackBar(snackbar);
  snackbarKey.currentState?.showSnackBar(snackbar);
}
