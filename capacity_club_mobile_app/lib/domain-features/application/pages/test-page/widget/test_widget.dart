import 'package:capacity_club_mobile_app/unused/collective-training/collective_training_card.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/params/collective_indoor_training_filter_params.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TestCollectiveTrainingCarousel extends StatefulWidget {
  const TestCollectiveTrainingCarousel(
      {super.key, required this.collectiveWorkouts});
  final List<Map<String, dynamic>> collectiveWorkouts;
  @override
  State<TestCollectiveTrainingCarousel> createState() =>
      _TestCollectiveTrainingCarouselState();
}

class _TestCollectiveTrainingCarouselState
    extends State<TestCollectiveTrainingCarousel> {
  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);
  final Color _greyTextColor = const Color(0xff808a96);

  int _currentImageSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        CarouselSlider(
          items: widget.collectiveWorkouts.map((workout) {
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
          children: widget.collectiveWorkouts.map((workout) {
            int index = widget.collectiveWorkouts.indexOf(workout);
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
