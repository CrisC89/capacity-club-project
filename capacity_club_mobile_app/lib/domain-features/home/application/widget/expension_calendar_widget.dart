import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class ExpansionCalender extends StatefulWidget {
  final DateTime? focusedDay;
  final bool Function(DateTime)? selectedDayPredicate;
  final Function(bool)? onExpansionChanged;
  final Function(DateTime, DateTime)? onDaySelected;
  final CalendarFormat calendarFormat;

  const ExpansionCalender({
    super.key,
    required this.calendarFormat,
    this.onDaySelected,
    this.onExpansionChanged,
    this.selectedDayPredicate,
    this.focusedDay,
  });

  @override
  _ExpansionCalenderState createState() => _ExpansionCalenderState();
}

class _ExpansionCalenderState extends State<ExpansionCalender> {
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  void _onPickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _focusedDay,
      firstDate: DateTime.utc(2010, 10, 16),
      lastDate: DateTime.utc(2030, 3, 14),
    );

    if (pickedDate != null && pickedDate != _focusedDay) {
      setState(() {
        _focusedDay = pickedDate;
      });
      if (widget.onDaySelected != null) {
        widget.onDaySelected!(pickedDate, pickedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, 0),
            color: AppTheme.colorForShadow,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: _buildCalendar()),
          IconButton(
            icon: Icon(Icons.calendar_today, color: AppTheme.black),
            onPressed: _onPickDate,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      onDaySelected: widget.onDaySelected,
      selectedDayPredicate: widget.selectedDayPredicate,
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarFormat: _calendarFormat,
      availableGestures: AvailableGestures.horizontalSwipe,
      daysOfWeekHeight: 22,
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) {
          return DateFormat('E').format(date)[0];
        },
        weekdayStyle: AppTheme.blackBold16,
        weekendStyle: AppTheme.blackBold16,
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: AppTheme.blackShadowSemiBold16,
        todayTextStyle: AppTheme.whiteSemiBold16,
        selectedTextStyle: AppTheme.whiteSemiBold18,
        weekendTextStyle: AppTheme.blackShadowSemiBold16,
        outsideTextStyle: AppTheme.dustyGraySemiBold16,
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.deepTeal,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleTextStyle: AppTheme.blackBold18,
        leftChevronIcon: Icon(Icons.chevron_left, color: AppTheme.black),
        rightChevronIcon: Icon(Icons.chevron_right, color: AppTheme.black),
        leftChevronVisible: true,
        rightChevronVisible: true,
        titleCentered: true,
      ),
    );
  }
}
