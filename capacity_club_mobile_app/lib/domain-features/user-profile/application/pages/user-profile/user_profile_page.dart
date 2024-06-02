import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Définir l'état local pour UserPage ici

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('User Page'),
    );
  }
}
