import 'package:flutter/material.dart';

class SettingPageLoadingView extends StatelessWidget {
  const SettingPageLoadingView({super.key});
  @override
  Widget build(BuildContext context) {
    //Adaptative circular progress indicator for ios or android device
    return const CircularProgressIndicator.adaptive();
  }
}
