import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
// Light Mode Colors
  static const Color kPrimaryColorLight = Color(0xFF007AFF);
  static const Color kAccentColorLight = Color(0xFFFF4081);
  static const Color kBackgroundColorLight = Color(0xFFF5F5F5);
  static const Color kSurfaceColorLight = Color(0xFFFFFFFF);
  static const Color kSecondaryColorLight = Color(0xFF40E0D0);
  static const Color kTextColorLight = Color(0xFF2C3E50);

// Dark Mode Colors
  static const Color kPrimaryColorDark = Color(0xFF032541);
  static const Color kAccentColorDark = Color(0xFFFF4081);
  static const Color kBackgroundColorDark = Color(0xFF15202B);
  static const Color kSurfaceColorDark = Color(0xFF242424);
  static const Color kSecondaryColorDark = Color(0xFF00FFAA);
  static const Color kTextColorDark = Color(0xFFFFFFFF);

  // Light Mode Colors
  static const Color kPrimaryColorLightBis = Color(0xFF007BFF);
  static const Color kAccentColorLightBis = Color(0xFFFF00FF);
  static const Color kBackgroundColorLightBis = Color(0xFFFAFAFA);
  static const Color kSurfaceColorLightBis = Color(0xFFFFFFFF);
  static const Color kSecondaryColorLightBis = Color(0xFF00FFAB);
  static const Color kTextColorLightBis = Color(0xFF464646);

// Dark Mode Colors
  static const Color kPrimaryColorDarkBis = Color(0xFF0A1931);
  static const Color kAccentColorDarkBis = Color(0xFFFF00FF);
  static const Color kBackgroundColorDarkBis = Color(0xFF121212);
  static const Color kSurfaceColorDarkBis = Color(0xFF222222);
  static const Color kSecondaryColorDarkBis = Color(0xFF00FFAB);
  static const Color kTextColorDarkBis = Color(0xFFEBEBEB);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: kPrimaryColorLight,
    scaffoldBackgroundColor: kSurfaceColorLight,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kTextColorLight),
      bodyMedium: TextStyle(color: kTextColorLight),
      displayLarge: TextStyle(color: kTextColorLight),
      displayMedium: TextStyle(color: kTextColorLight),
      bodySmall: TextStyle(color: kTextColorLight),
    ),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColorLight,
      secondary: kSecondaryColorLight,
      background: kBackgroundColorLight,
      surface: kSurfaceColorLight,
      onPrimary: kSurfaceColorLight,
      onSecondary: kTextColorLight,
      onBackground: kTextColorLight,
      onSurface: kTextColorLight,
    )
        .copyWith(secondary: kAccentColorLight)
        .copyWith(background: kBackgroundColorLight),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: kPrimaryColorDark,
    hintColor: kAccentColorDark,
    scaffoldBackgroundColor: kSurfaceColorDark,
    colorScheme: const ColorScheme.dark(
      primary: kPrimaryColorDark,
      secondary: kSecondaryColorDark,
      background: kBackgroundColorDark,
      surface: kSurfaceColorDark,
      onPrimary: kTextColorDark,
      onSecondary: kTextColorDark,
      onBackground: kTextColorDark,
      onSurface: kTextColorDark,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kTextColorDark),
      bodyMedium: TextStyle(color: kTextColorDark),
      displayLarge: TextStyle(color: kTextColorDark),
      displayMedium: TextStyle(color: kTextColorDark),
      bodySmall: TextStyle(color: kTextColorDark),
    ),
  );

  final ThemeData lightThemeBis = ThemeData(
    primaryColor: kPrimaryColorLightBis,
    hintColor: kAccentColorLightBis,
    scaffoldBackgroundColor: kSurfaceColorLightBis,
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColorLightBis,
      secondary: kSecondaryColorLightBis,
      background: kBackgroundColorLightBis,
      surface: kSurfaceColorLightBis,
      onPrimary: kSurfaceColorLightBis,
      onSecondary: kTextColorLightBis,
      onBackground: kTextColorLightBis,
      onSurface: kTextColorLightBis,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kTextColorLightBis),
      bodyMedium: TextStyle(color: kTextColorLightBis),
      displayLarge: TextStyle(color: kTextColorLightBis),
      displayMedium: TextStyle(color: kTextColorLightBis),
      bodySmall: TextStyle(color: kTextColorLightBis),
    ),
  );

  final ThemeData darkThemeBis = ThemeData(
    primaryColor: kPrimaryColorDarkBis,
    hintColor: kAccentColorDarkBis,
    scaffoldBackgroundColor: kSurfaceColorDarkBis,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kTextColorDarkBis),
      bodyMedium: TextStyle(color: kTextColorDarkBis),
      displayLarge: TextStyle(color: kTextColorDarkBis),
      displayMedium: TextStyle(color: kTextColorDarkBis),
      bodySmall: TextStyle(color: kTextColorDarkBis),
    ),
    colorScheme: const ColorScheme.dark(
      primary: kPrimaryColorDarkBis,
      secondary: kSecondaryColorDarkBis,
      background: kBackgroundColorDarkBis,
      surface: kSurfaceColorDarkBis,
      onPrimary: kTextColorDarkBis,
      onSecondary: kTextColorDarkBis,
      onBackground: kTextColorDarkBis,
      onSurface: kTextColorDarkBis,
    ).copyWith(background: kBackgroundColorDarkBis),
  );
}
