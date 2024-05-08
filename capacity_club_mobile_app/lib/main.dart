import 'package:capacity_club_mobile_app/core/init.page.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
    child: const InitPage(),
  ));
}
