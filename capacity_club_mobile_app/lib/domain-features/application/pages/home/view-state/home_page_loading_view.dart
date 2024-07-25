import 'package:flutter/material.dart';

class HomePageLoadingView extends StatelessWidget {
  const HomePageLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    //Adaptative circular progress indicator for ios or android device
    return const CircularProgressIndicator.adaptive();
  }
}
