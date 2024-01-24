import 'package:capacity_club_mobile_app/features/core/weekly-calendar/weekly-calendar-button.widget.dart';
import 'package:capacity_club_mobile_app/features/core/weekly-calendar/weekly-calendar.widget.dart';
import 'package:capacity_club_mobile_app/features/user/domain/entity/member.entity.dart';
import 'package:flutter/material.dart';

class UserLoadedView extends StatelessWidget {
  final Member member;

  const UserLoadedView({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('DATA LOADED'),
          Text('Nom : ${member.lastname}'),
          Text('Prénom : ${member.firstname}'),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 5),
              WeeklyCalendarButton(
                  day: "1",
                  index: 1,
                  isSelected: false,
                  callback: () {
                    print("1");
                  }),
              const SizedBox(width: 5),
              WeeklyCalendarButton(
                  day: "2",
                  index: 2,
                  isSelected: true,
                  callback: () {
                    print("2");
                  }),
              const SizedBox(width: 5),
              WeeklyCalendarButton(
                  day: "3",
                  index: 3,
                  isSelected: false,
                  callback: () {
                    print("3");
                  })
            ],
          )
        ],
      ),
    );
  }
}
