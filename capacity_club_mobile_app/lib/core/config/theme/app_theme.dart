import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme2 {
  AppTheme2._();

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xfffafafa),
      brightness: Brightness.light,
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      }),
      fontFamily: GoogleFonts.openSans().fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xfffafafa),
        surfaceTintColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff393d40),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Color(0xFFf7f7f7),
            systemNavigationBarIconBrightness: Brightness.dark),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xff393d40),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffeaebed)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffeaebed)),
          ),
          hintStyle: TextStyle(color: Color(0xffeaebed)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          isDense: true),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Color(0xff1e86ff),
        labelColor: Color(0xff1e86ff),
        unselectedLabelColor: Colors.grey,
        dividerColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Color(0xff393d40)),
      ));
  static final lightTheme2 = ThemeData(
      scaffoldBackgroundColor: const Color(0xffffffff),
      brightness: Brightness.light,
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      }),
      fontFamily: GoogleFonts.openSans().fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffffffff),
        surfaceTintColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff393d40),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Color(0xFFf7f7f7),
            systemNavigationBarIconBrightness: Brightness.dark),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xff393d40),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffeaebed)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffeaebed)),
          ),
          hintStyle: TextStyle(color: Color(0xffeaebed)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          isDense: true),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Color(0xff1e86ff),
        labelColor: Color(0xff1e86ff),
        unselectedLabelColor: Colors.grey,
        dividerColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Color(0xff393d40)),
      ));
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      }),
      fontFamily: GoogleFonts.openSans().fontFamily,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Color(0xFF1c1b1f),
              systemNavigationBarIconBrightness: Brightness.light),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xffe6e1e5),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
      inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff25232a)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff25232a)),
          ),
          filled: true,
          fillColor: Color(0xff25232a),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          isDense: true),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Color(0xff1e86ff),
        labelColor: Color(0xff1e86ff),
        unselectedLabelColor: Colors.white,
        dividerColor: Colors.transparent,
      ));
}


//GoogleFonts.openSans().fontFamily,