import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> publicNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'public');
final GlobalKey<NavigatorState> authenticatedNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'authenticated');
