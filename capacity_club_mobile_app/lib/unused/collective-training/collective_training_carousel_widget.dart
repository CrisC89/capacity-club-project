import 'package:capacity_club_mobile_app/unused/collective-training/collective_training_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CollectiveTrainingCarousel extends StatefulWidget {
  const CollectiveTrainingCarousel({super.key});

  @override
  State<CollectiveTrainingCarousel> createState() =>
      _CollectiveTrainingCarouselState();
}

class _CollectiveTrainingCarouselState
    extends State<CollectiveTrainingCarousel> {
  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);
  final Color _greyTextColor = const Color(0xff808a96);

  int _currentImageSlider = 0;

  final List<Map<String, dynamic>> workouts = [
    {
      'workoutName': 'Death by Burpees',
      'date': '2024-06-08',
      'startTime': '11:00 AM',
      'endTime': '12:00 PM',
      'totalSlots': 15,
      'registeredSlots': 15,
      'isUserRegistered': true,
    },
    {
      'workoutName': 'Firebreather',
      'date': '2024-06-09',
      'startTime': '9:00 AM',
      'endTime': '10:00 AM',
      'totalSlots': 25,
      'registeredSlots': 5,
      'isUserRegistered': false,
    },
    {
      'workoutName': 'Iron Fist',
      'date': '2024-06-11',
      'startTime': '6:00 AM',
      'endTime': '7:00 AM',
      'totalSlots': 15,
      'registeredSlots': 12,
      'isUserRegistered': true,
    },
    {
      'workoutName': 'Endurance WOD',
      'date': '2024-06-12',
      'startTime': '5:00 PM',
      'endTime': '6:00 PM',
      'totalSlots': 25,
      'registeredSlots': 20,
      'isUserRegistered': false,
    },
    {
      'workoutName': 'Power Hour',
      'date': '2024-06-13',
      'startTime': '8:00 AM',
      'endTime': '9:00 AM',
      'totalSlots': 30,
      'registeredSlots': 25,
      'isUserRegistered': false,
    },
    {
      'workoutName': 'Metcon Madness',
      'date': '2024-06-14',
      'startTime': '4:00 PM',
      'endTime': '5:00 PM',
      'totalSlots': 20,
      'registeredSlots': 10,
      'isUserRegistered': true,
    },
    {
      'workoutName': 'Warrior WOD',
      'date': '2024-06-15',
      'startTime': '9:00 AM',
      'endTime': '10:00 AM',
      'totalSlots': 20,
      'registeredSlots': 15,
      'isUserRegistered': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        CarouselSlider(
          items: workouts.map((workout) {
            return WorkoutCard(
              workoutName: workout['workoutName'],
              date: workout['date'],
              startTime: workout['startTime'],
              endTime: workout['endTime'],
              totalSlots: workout['totalSlots'],
              registeredSlots: workout['registeredSlots'],
              isUserRegistered: workout['isUserRegistered'],
              onRegister: () {
                setState(() {
                  workout['isUserRegistered'] = true;
                  workout['registeredSlots'] += 1;
                });
              },
              onUnregister: () {
                setState(() {
                  workout['isUserRegistered'] = false;
                  workout['registeredSlots'] -= 1;
                });
              },
              onDetails: () {},
            );
          }).toList(),
          options: CarouselOptions(
            aspectRatio: 2.5,
            viewportFraction: 0.9,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 300),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageSlider = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: workouts.map((workout) {
            int index = workouts.indexOf(workout);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: _currentImageSlider == index ? 20.0 : 6.0,
              height: 6.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _currentImageSlider == index
                    ? _mainColor
                    : Colors.grey[300],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
