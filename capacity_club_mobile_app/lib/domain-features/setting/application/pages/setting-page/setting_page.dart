import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // Définir l'état local pour SettingPage ici

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Setting Page'),
    );
  }
}
