import 'package:flutter/material.dart';

class CollectiveTrainingSessionDetailLoadingView extends StatelessWidget {
  const CollectiveTrainingSessionDetailLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
