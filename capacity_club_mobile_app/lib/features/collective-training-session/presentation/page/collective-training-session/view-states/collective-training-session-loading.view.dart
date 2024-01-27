import 'package:flutter/material.dart';

class CollectiveTrainingSessionLoadingView extends StatelessWidget {
  const CollectiveTrainingSessionLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
