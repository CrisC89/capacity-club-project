import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTrainingTemplateCarousel extends StatefulWidget {
  const HomeTrainingTemplateCarousel({super.key});

  @override
  State<HomeTrainingTemplateCarousel> createState() =>
      _HomeTrainingTemplateCarouselState();
}

class _HomeTrainingTemplateCarouselState
    extends State<HomeTrainingTemplateCarousel> {
  int _currentImageSlider = 0;

  var homeTraining = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        CarouselSlider(
          items: homeTraining.map((indoorTraining) {
            return Card();
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
        const SizedBox(height: 12),
      ],
    );
  }
}
