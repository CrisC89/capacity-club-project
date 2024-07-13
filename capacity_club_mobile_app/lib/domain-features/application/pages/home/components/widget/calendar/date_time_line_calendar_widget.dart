import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class DateTimeLineWithYearSelector extends StatefulWidget {
  const DateTimeLineWithYearSelector({super.key});

  @override
  _DateTimeLineWithYearSelectorState createState() =>
      _DateTimeLineWithYearSelectorState();
}

class _DateTimeLineWithYearSelectorState
    extends State<DateTimeLineWithYearSelector> {
  final Color _mainColorOpaque = Color.fromARGB(100, 4, 136, 183);
  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);
  //final Color _greyTextColor = const Color(0xff808a96);
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
              icon: const Icon(Icons.arrow_back,
                  size: 24, color: Color(0xff949494)),
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
              style: AppTheme.subTitleTextStyle,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward,
                  size: 24, color: Color(0xff949494)),
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
              selectedDateStyle: AppTheme.dustyGrayMedium16,
              dateFormatter: const DateFormatter.fullDateDMY(),
              monthStyle: AppTheme.dustyGrayMedium16),
          activeColor: _mainColor,
          dayProps: EasyDayProps(
            height: 56.0,
            width: 56.0,
            dayStructure: DayStructure.dayNumDayStr,
            inactiveDayStyle:
                const DayStyle(dayNumStyle: AppTheme.unselectedDate),
            activeDayStyle: const DayStyle(dayNumStyle: AppTheme.selectedDate),
            todayHighlightStyle: TodayHighlightStyle.withBackground,
            todayHighlightColor: _mainColorOpaque,
            todayStyle: const DayStyle(dayNumStyle: AppTheme.unselectedDate),
          ),
        ),
      ],
    );
  }
}
