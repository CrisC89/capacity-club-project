import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class DateTimeLineCalendar extends StatefulWidget {
  const DateTimeLineCalendar({super.key});

  @override
  _DateTimeLineCalendarState createState() => _DateTimeLineCalendarState();
}

class _DateTimeLineCalendarState extends State<DateTimeLineCalendar> {
  final Color _mainColor = const Color(0xffe77610);
  final Color _greyTextColor = const Color(0xff808a96);
  final bool _isDarkMode = false;

  int _currentYear = DateTime.now().year;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  _currentYear--;
                  _selectedDate = DateTime(
                      _currentYear, _selectedDate.month, _selectedDate.day);
                });
              },
            ),
            Text(
              '$_currentYear',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                setState(() {
                  _currentYear++;
                  _selectedDate = DateTime(
                      _currentYear, _selectedDate.month, _selectedDate.day);
                });
              },
            ),
          ],
        ),
        EasyDateTimeLine(
          initialDate: _selectedDate,
          onDateChange: (selectedDate) {
            setState(() {
              _selectedDate = selectedDate;
            });
          },
          headerProps: EasyHeaderProps(
            padding: EdgeInsets.zero,
            selectedDateStyle: TextStyle(
              color: _isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
            dateFormatter: const DateFormatter.fullDateDMY(),
          ),
          activeColor: _mainColor,
          dayProps: EasyDayProps(
            height: 56.0,
            width: 56.0,
            dayStructure: DayStructure.dayNumDayStr,
            inactiveDayStyle: const DayStyle(
              dayNumStyle: TextStyle(
                fontSize: 24.0,
              ),
            ),
            activeDayStyle: const DayStyle(
              dayNumStyle: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            todayHighlightStyle: TodayHighlightStyle.withBackground,
            todayHighlightColor: Colors.orange[100],
          ),
        ),
      ],
    );
  }
}
