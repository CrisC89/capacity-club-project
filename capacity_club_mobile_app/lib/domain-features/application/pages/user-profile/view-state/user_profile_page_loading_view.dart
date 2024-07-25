import 'package:flutter/material.dart';

class UserProfilePageLoadingView extends StatelessWidget {
  const UserProfilePageLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    //Adaptative circular progress indicator for ios or android device
    return const CircularProgressIndicator.adaptive();
  }
}
