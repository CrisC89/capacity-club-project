import 'package:flutter/material.dart';

Widget cardLogo(BuildContext context) {
  return Center(
      child: Opacity(
          opacity: 0.7,
          child: Image.asset('assets/img/icon_logo_v2-bg-remove.png',
              width: MediaQuery.of(context).size.width * 0.15)));
  //width:140
}
