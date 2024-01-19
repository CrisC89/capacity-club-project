import 'package:flutter/material.dart';

class UserLoadingView extends StatelessWidget {
  const UserLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
