import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/unused/collective-training/collective_training_carousel_widget.dart';

import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class TestPageLoaded extends StatefulWidget {
  final List<Map<String, dynamic>> collectiveIndoorTrainingList;
  final List<Map<String, dynamic>> individualIndoorTrainingList;

  TestPageLoaded({
    Key? key,
    required this.collectiveIndoorTrainingList,
    required this.individualIndoorTrainingList,
  }) : super(key: key);

  @override
  _TestPageLoadedState createState() => _TestPageLoadedState();
}

class _TestPageLoadedState extends State<TestPageLoaded> {
  String timeVal = '08:00';
  final Color _mainColorBack = const Color(0xffe77610);
  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);
  final Color _tabBarColor = const Color(0xFF15121f);
  final Color _greyColor = const Color(0xff93989b);
  final Color _darkColor = const Color(0xff25232a);
  bool _isDarkMode = false;

  Widget _customRadioButton2({required String value}) {
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
                  : Colors.white,
        ),
        child: Center(
          child: Text(
            value,
            style: timeVal == value
                ? AppTheme.whiteTypeMedium16
                : AppTheme.dustyGrayMedium16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                child: Divider(thickness: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Text('COLLECTIVE TRAINING',
                    style: AppTheme.subTitleTextStyle),
              ),
              const Expanded(
                child: Divider(thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                child: Divider(thickness: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Text('INDIVIDUAL TRAINING',
                    style: AppTheme.subTitleTextStyle),
              ),
              const Expanded(
                child: Divider(thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: widget.individualIndoorTrainingList.map((training) {
              return _customRadioButton2(value: training['startTime']);
            }).toList(),
          ),
          const SizedBox(height: 24),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return _mainColor.withOpacity(0.8);
                  }
                  return _mainColor;
                },
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Book Now',
                style: AppTheme.whiteTypeMedium14,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
