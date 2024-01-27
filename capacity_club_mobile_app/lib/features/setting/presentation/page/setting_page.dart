import 'package:capacity_club_mobile_app/features/core/contract/page_config.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static const pageConfig =
      PageConfig(icon: Icons.settings, name: 'setting', child: SettingPage());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
    );
  }
}
