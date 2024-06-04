import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  Widget profileOption(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        profileOption(context, 'User Info'),
        profileOption(context, 'Historique'),
        profileOption(context, 'Member Plan'),
      ],
    );
  }
}
