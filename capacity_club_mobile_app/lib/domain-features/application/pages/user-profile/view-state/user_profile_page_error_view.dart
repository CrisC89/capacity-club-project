import 'package:flutter/material.dart';

class UserProfilePageErrorView extends StatelessWidget {
  const UserProfilePageErrorView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Text('ERROR, please try again'),
    );
  }
}
