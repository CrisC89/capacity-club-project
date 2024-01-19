import 'package:flutter/material.dart';

class UserErrorView extends StatelessWidget {
  const UserErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Text('ERROR, please try again'),
    );
  }
}
