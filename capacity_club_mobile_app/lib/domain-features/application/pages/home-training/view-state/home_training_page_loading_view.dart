import 'package:flutter/material.dart';

class HomeTrainingPageLoadingView extends StatelessWidget {
  const HomeTrainingPageLoadingView({super.key});
  @override
  Widget build(BuildContext context) {
    //Adaptative circular progress indicator for ios or android device
    return const CircularProgressIndicator.adaptive();
  }
}
