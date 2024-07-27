import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/indoor-training/collective-training/collective_indoor_training_card_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/indoor-training/entity/indoor_training_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CollectiveIndoorTrainingCarousel extends StatefulWidget {
  final List<IndoorTrainingEntity> indoorTrainings;

  const CollectiveIndoorTrainingCarousel(
      {super.key, required this.indoorTrainings});

  @override
  State<CollectiveIndoorTrainingCarousel> createState() =>
      _CollectiveIndoorTrainingCarouselState();
}

class _CollectiveIndoorTrainingCarouselState
    extends State<CollectiveIndoorTrainingCarousel> {
  final Color _mainColor = Color.fromARGB(255, 4, 136, 183);

  int _currentImageSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        CarouselSlider(
          items: widget.indoorTrainings.map((indoorTraining) {
            return CollectiveIndoorTrainingCard(
                indoorTraining: indoorTraining,
                onRegister: () {},
                onUnregister: () {});
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
          children: widget.indoorTrainings.map((workout) {
            int index = widget.indoorTrainings.indexOf(workout);
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
