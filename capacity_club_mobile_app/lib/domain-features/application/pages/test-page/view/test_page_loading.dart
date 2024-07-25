import 'package:flutter/material.dart';

class TestPageLoading extends StatelessWidget {
  const TestPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
