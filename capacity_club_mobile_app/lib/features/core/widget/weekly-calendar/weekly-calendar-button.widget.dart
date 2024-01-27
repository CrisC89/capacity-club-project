import 'package:capacity_club_mobile_app/features/core/widget/weekly-calendar/weekly-calendar.utils.dart';
import 'package:flutter/material.dart';

class WeeklyCalendarButton extends StatelessWidget {
  final String day;
  final int index;
  final bool isSelected;
  final VoidCallback callback;

  const WeeklyCalendarButton(
      {super.key,
      required this.day,
      required this.index,
      required this.isSelected,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return InkResponse(
        onTap: callback,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 40,
            height: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white70),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(WeeklyCalendarUtils.dayOfWeek(index),
                      style: TextStyle(
                          fontSize: 12.0,
                          color: isSelected ? Colors.red : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Titillium')),
                  const SizedBox(height: 2),
                  Text(day,
                      style: TextStyle(
                          fontSize: 10.0,
                          color: isSelected ? Colors.red : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Titillium'))
                ],
              ),
            ),
          ),
        ));
  }
}
