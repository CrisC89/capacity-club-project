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

  String _dayOfWeek() {
    String day;
    switch (index) {
      case 1:
        day = 'LUN';
        break;
      case 2:
        day = 'MAR';
        break;
      case 3:
        day = 'MER';
        break;
      case 4:
        day = 'JEU';
        break;
      case 5:
        day = 'VEN';
        break;
      case 6:
        day = 'SAM';
        break;
      case 7:
        day = 'DIM';
        break;
      default:
        day = '';
    }

    return day;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkResponse(
        onTap: callback,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white70),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_dayOfWeek(),
                      style: TextStyle(
                          fontSize: 15.0,
                          color: isSelected ? Colors.red : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Titillium')),
                  const SizedBox(height: 2),
                  Text(day,
                      style: TextStyle(
                          fontSize: 13.0,
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
