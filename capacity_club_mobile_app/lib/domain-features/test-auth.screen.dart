import 'package:capacity_club_mobile_app/common/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/common/config/navigator_key.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/widget/collective_training_carousel_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final Color _mainColor = const Color(0xffe77610);
  final Color _tabBarColor = const Color(0xFF15121f);
  final Color _greyColor = const Color(0xff93989b);
  final Color _darkColor = const Color(0xff25232a);

  final bool _isDarkMode = false;

  String timeVal = '08:00';

  int _currentImageSlider = 0;

  Widget _customRadioButton2({value = '08:00'}) {
    final double size = (MediaQuery.of(context).size.width - 64 - (16 * 3)) / 4;

    return GestureDetector(
      onTap: () {
        setState(() {
          timeVal = value;
        });
      },
      child: Container(
        width: size,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: timeVal == value
                ? _mainColor
                : _isDarkMode
                    ? _darkColor
                    : Colors.white),
        child: Center(
            child: Text(value.toString(),
                style: TextStyle(
                    color: timeVal == value
                        ? Colors.white
                        : _isDarkMode
                            ? Colors.white
                            : Colors.black,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        DateTimeLineWithYearSelector(),
        SizedBox(
          height: 20,
        ),
        const Text('COLLECTIVE TRAINING',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        const CollectiveTrainingCarousel(),
        const Divider(),
        const SizedBox(height: 12),
        const Text('INDIVIDUAL TRAINING',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _customRadioButton2(value: '08:00'),
            _customRadioButton2(value: '09:00'),
            _customRadioButton2(value: '10:00'),
            _customRadioButton2(value: '11:00'),
            _customRadioButton2(value: '12:00'),
            _customRadioButton2(value: '13:00'),
            _customRadioButton2(value: '14:00'),
            _customRadioButton2(value: '15:00'),
            _customRadioButton2(value: '16:00'),
            _customRadioButton2(value: '17:00'),
            _customRadioButton2(value: '18:00'),
            _customRadioButton2(value: '19:00'),
          ],
        ),
        const SizedBox(height: 24),
        TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) => _mainColor,
              ),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              )),
              padding: WidgetStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 18)),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Book Now',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ))
      ],
    ));
  }
}

class DateTimeLineWithYearSelector extends StatefulWidget {
  const DateTimeLineWithYearSelector({super.key});

  @override
  _DateTimeLineWithYearSelectorState createState() =>
      _DateTimeLineWithYearSelectorState();
}

class _DateTimeLineWithYearSelectorState
    extends State<DateTimeLineWithYearSelector> {
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
                fontSize: 18.0,
              ),
            ),
            activeDayStyle: const DayStyle(
              dayNumStyle: TextStyle(
                fontSize: 18.0,
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
