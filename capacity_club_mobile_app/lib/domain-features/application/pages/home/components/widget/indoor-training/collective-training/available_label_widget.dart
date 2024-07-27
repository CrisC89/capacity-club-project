import 'package:capacity_club_mobile_app/core/widgets/label/genric_label_widget.dart';
import 'package:flutter/material.dart';

Widget availableLabel(BuildContext context, int nb_place, int nb_subscription) {
  return (nb_place - nb_subscription > 0)
      ? GenericLabel(
          textColor: Colors.green,
          backgroundColor: Color.fromARGB(255, 144, 245, 198),
          text: 'Available')
      : GenericLabel(
          textColor: Colors.red,
          backgroundColor: const Color(0xffffeae9),
          text: 'Full');
}
