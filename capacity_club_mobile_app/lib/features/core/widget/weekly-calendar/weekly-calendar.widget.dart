import 'package:capacity_club_mobile_app/features/core/widget/weekly-calendar/weekly-calendar-button.widget.dart';
import 'package:capacity_club_mobile_app/features/core/widget/weekly-calendar/weekly-calendar.utils.dart';
import 'package:flutter/material.dart';

class WeeklyCalendar extends StatefulWidget {
  final Function(DateTime date) onDateChange;

  const WeeklyCalendar({super.key, required this.onDateChange});

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  List<DateTime> currentWeek = [];
  late DateTime currentDay;
  late DateTime firstCalendarDay;
  late DateTime currentWeekFirstDay;
  late DateTime selectedDate;
  int currentPageIndex = 1000;
  int scrollIndex = 0;

  void _goToNextWeek() {
    setState(() {
      currentWeekFirstDay = currentWeekFirstDay.add(const Duration(days: 7));
      currentWeek = WeeklyCalendarUtils.generateDaysOfWeek(currentWeekFirstDay);
      scrollIndex++;
    });
  }

  void _goToPreviousWeek() {
    if (scrollIndex > 0) {
      setState(() {
        currentWeekFirstDay =
            currentWeekFirstDay.subtract(const Duration(days: 7));
        currentWeek =
            WeeklyCalendarUtils.generateDaysOfWeek(currentWeekFirstDay);
        scrollIndex--;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentDay = DateTime.now();
    selectedDate = currentDay;
    currentWeekFirstDay =
        WeeklyCalendarUtils.generateFirstDayOfWeek(currentDay);
    firstCalendarDay = currentWeekFirstDay.subtract(const Duration(days: 365));
    currentWeek = WeeklyCalendarUtils.generateDaysOfWeek(currentWeekFirstDay);
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(initialPage: currentPageIndex);

    return Container(
      height: 125,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.background,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${WeeklyCalendarUtils.monthOfYear(firstCalendarDay.month)} ${firstCalendarDay.year}",
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Titillium')),
                    //datePickerButton(context, _onPressDatePicker, selectedDate, firstCalendarDay)
                    IconButton(
                      icon:
                          const Icon(Icons.calendar_today, color: Colors.black),
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: const ColorScheme.light(
                                      primary: Color.fromRGBO(43, 70, 97, 0.7)),
                                  buttonTheme: const ButtonThemeData(
                                      textTheme: ButtonTextTheme.primary),
                                ),
                                child: child!,
                              );
                            });
                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = DateTime(pickedDate.year,
                                pickedDate.month, pickedDate.day);
                            currentWeekFirstDay =
                                WeeklyCalendarUtils.generateFirstDayOfWeek(
                                    selectedDate);
                            currentWeek =
                                WeeklyCalendarUtils.generateDaysOfWeek(
                                    currentWeekFirstDay);
                            widget.onDateChange(selectedDate);
                          });
                        }
                      },
                    ),
                  ],
                ),
                Expanded(
                    child: PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          if (index > currentPageIndex) {
                            _goToNextWeek();
                          } else if (index < currentPageIndex) {
                            _goToPreviousWeek();
                          }
                          currentPageIndex = index;
                        },
                        itemBuilder: (context, index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: currentWeek
                                  .map((date) => WeeklyCalendarButton(
                                      day:
                                          "${date.day.toString()}/${date.month.toString()}",
                                      index: date.weekday,
                                      isSelected: date == selectedDate,
                                      callback: () {
                                        setState(() {
                                          selectedDate = DateTime(
                                              date.year, date.month, date.day);
                                          widget.onDateChange(selectedDate);
                                        });
                                      }))
                                  .toList());
                        })),
              ])),
    );
  }
}
