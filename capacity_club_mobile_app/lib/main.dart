import 'package:capacity_club_mobile_app/config/routes/routes.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/data/repository/collective-training-session.repositor-mock.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/repository/collective-training-session.repository.dart';
import 'package:capacity_club_mobile_app/features/user/data/repository/member-repository-mock.dart';
import 'package:capacity_club_mobile_app/features/user/domain/repository/member.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<MemberRepository>(
        create: (context) => MemberRepositoryMock()),
    RepositoryProvider<CollectiveTrainingSessionRepository>(
        create: (context) => CollectiveTrainingSessionRepositoryMock()),
  ], child: const BasicApp()));
}

class BasicApp extends StatelessWidget {
  const BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Capacity Club',
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      themeMode: ThemeMode.system,
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
      ).copyWith(
        textTheme: ThemeData.light()
            .textTheme
            .apply(
              fontFamily: 'Titillium',
            )
            .copyWith(
              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
            ),
      ),
      darkTheme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
      ).copyWith(
        textTheme: ThemeData.dark()
            .textTheme
            .apply(
              fontFamily: 'Titillium',
            )
            .copyWith(
              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
            ),
      ),
      routerConfig: routes,
    );
  }
}
