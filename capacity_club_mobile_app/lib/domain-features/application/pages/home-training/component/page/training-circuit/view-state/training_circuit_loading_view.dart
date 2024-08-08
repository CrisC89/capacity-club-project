import 'package:flutter/material.dart';

class TrainingCircuitLoadingView extends StatelessWidget {
  const TrainingCircuitLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    //Adaptative circular progress indicator for ios or android device
    return const CircularProgressIndicator.adaptive();
  }
}
