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

  static const primaryColor = Color(0xff005662);
  static const pink = Colors.pink;
  static const yellow = Color(0xffFFCE31);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  Color offGrey = Colors.grey.shade300;
  static const Color brightGrey = Color(0xffE9E9E9);
  static const Color amber = Colors.amber;
  static const Color transparent = Colors.transparent;
  static const Color deepTeal = Color(0xff005662);
  static const Color blueChill = Color(0xff097E8E);
  static const Color nobel = Color(0xffB7B7B7);
  static const Color dustyGray = Color(0xff949494);
  static const Color silver = Color(0xffC4C4C4);
  static const Color pinputShadow = Color(0xff8D8D8D);
  static const Color mercury = Color(0xffE6E6E6);
  static const Color redIcon = Color(0xffD2121D);
  static const Color whiteType = Color(0xffFFF4F4);
  static const Color blueGreen = Color(0xff0F9EB2);
  static const Color platinum = Color(0xffE4E5E7);
  static const Color chineseRed = Color(0xffA13A24);
  static const Color hignLand = Color(0xff6B8662);
  static const Color darkBlue = Color(0xff294181);
  static const Color wildOrchid = Color(0xffC97AA0);
  static const Color oldRose = Color(0xffBD8083);
  static const Color antiFlashWhite = Color(0xffF0F0F0);
  static const Color colorForShadow = Color.fromRGBO(0, 0, 0, 0.25);

  static const double fixPadding = 10.0;

  static const SizedBox heightSpace2 = SizedBox(height: 2);
  static const SizedBox widthSpace2 = SizedBox(width: 2);
  static const SizedBox widthSpace5 = SizedBox(width: 5);
  static const SizedBox heightSpace5 = SizedBox(height: 5);
  static const SizedBox widthSpace10 = SizedBox(width: fixPadding);
  static const SizedBox heightSpace10 = SizedBox(height: fixPadding);
  static const SizedBox widthSpace15 = SizedBox(width: 15);
  static const SizedBox heightSpace15 = SizedBox(height: 15);
  static const SizedBox widthSpace20 = SizedBox(width: 20);
  static const SizedBox heightSpace20 = SizedBox(height: 20);
  static const SizedBox heightSpace25 = SizedBox(height: 25);
  static const SizedBox widthSpace30 = SizedBox(width: 30);
  static const SizedBox heightSpace30 = SizedBox(height: 30);

  static const SizedBox heightSpace40 = SizedBox(height: 40);
  static const SizedBox heightSpace50 = SizedBox(height: 50);
  static const SizedBox heightSpace100 = SizedBox(height: 100);

//TextStyles

//Custom
  static const TextStyle blackSemiBold24 = TextStyle(
    color: black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackSemiBold22 = TextStyle(
    color: black,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  static const TextStyle dustyGrayMedium16 = TextStyle(
    fontSize: 16,
    color: dustyGray,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackRegular16 = TextStyle(
      fontSize: 16,
      color: black,
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat');
  static const TextStyle blackRegular14 = TextStyle(
    fontSize: 14,
    color: black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteTypeMedium14 = TextStyle(
    fontSize: 14,
    color: whiteType,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteTypeSemiBold16 = TextStyle(
    fontSize: 16,
    color: whiteType,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteSemiBold16 = TextStyle(
    fontSize: 16,
    color: white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteRegular16 = TextStyle(
    fontSize: 16,
    color: white,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteSemiBold14 = TextStyle(
    fontSize: 14,
    color: white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteSemiBold10 = TextStyle(
    fontSize: 10,
    color: white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteTypeSemiBold14 = TextStyle(
    fontSize: 14,
    color: whiteType,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackBold16 = TextStyle(
    fontSize: 16,
    color: black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackBold18 = TextStyle(
    fontSize: 18,
    color: black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteBold22 = TextStyle(
    fontSize: 22,
    color: white,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowRegular16 = TextStyle(
    fontSize: 16,
    color: pinputShadow,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowSemiBold16 = TextStyle(
    fontSize: 16,
    color: pinputShadow,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowSemiBold18 = TextStyle(
    fontSize: 18,
    color: pinputShadow,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowSemiBold14 = TextStyle(
    fontSize: 14,
    color: pinputShadow,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowSemiBold15 = TextStyle(
    fontSize: 15,
    color: pinputShadow,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowSemiBold12 = TextStyle(
    fontSize: 12,
    color: pinputShadow,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowRegular14 = TextStyle(
    fontSize: 14,
    color: pinputShadow,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowMedium14 = TextStyle(
    fontSize: 14,
    color: pinputShadow,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowMedium16 = TextStyle(
    fontSize: 16,
    color: pinputShadow,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle pinputShadowMedium12 = TextStyle(
    fontSize: 12,
    color: pinputShadow,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle dustyGrayRegular14 = TextStyle(
    fontSize: 14,
    color: dustyGray,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
  static const TextStyle dustyGrayRegular16 = TextStyle(
    fontSize: 16,
    color: dustyGray,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteBold16 = TextStyle(
    fontSize: 16,
    color: white,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackSemiBold16 = TextStyle(
    fontSize: 16,
    color: black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackMedium16 = TextStyle(
    fontSize: 16,
    color: black,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackMedium18 = TextStyle(
    fontSize: 18,
    color: black,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackMedium14 = TextStyle(
    fontSize: 14,
    color: black,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackMedium12 = TextStyle(
    fontSize: 12,
    color: black,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteMedium14 = TextStyle(
    fontSize: 14,
    color: white,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackSemiBold18 = TextStyle(
    fontSize: 18,
    color: black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackSemiBold20 = TextStyle(
    fontSize: 20,
    color: black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackShadowSemiBold16 = TextStyle(
    fontSize: 16,
    color: black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle dustyGraySemiBold16 = TextStyle(
    fontSize: 16,
    color: dustyGray,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle whiteSemiBold18 = TextStyle(
    fontSize: 18,
    color: white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle blackSemiBold14 = TextStyle(
    fontSize: 14,
    color: black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealSemiBold16 = TextStyle(
    fontSize: 16,
    color: deepTeal,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealSemiBold18 = TextStyle(
    fontSize: 18,
    color: deepTeal,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealSemiBold15 = TextStyle(
    fontSize: 15,
    color: deepTeal,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealSemiBold30 = TextStyle(
    fontSize: 30,
    color: deepTeal,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealSemiBold24 = TextStyle(
    fontSize: 24,
    color: deepTeal,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealSemiBold14 = TextStyle(
    fontSize: 14,
    color: deepTeal,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealRegular16 = TextStyle(
    fontSize: 16,
    color: deepTeal,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealMedium16 = TextStyle(
    fontSize: 16,
    color: deepTeal,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealMedium14 = TextStyle(
    fontSize: 14,
    color: deepTeal,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealBold16 = TextStyle(
    fontSize: 16,
    color: deepTeal,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );
  static const TextStyle deepTealBold14 = TextStyle(
    fontSize: 14,
    color: deepTeal,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );
  static const TextStyle nobelSemiBold14 = TextStyle(
    fontSize: 14,
    color: nobel,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
  static const TextStyle nobelMedium16 = TextStyle(
    fontSize: 16,
    color: nobel,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static const TextStyle uniCode1 = TextStyle(fontSize: 25);
  static const TextStyle uniCode2 = TextStyle(fontSize: 20);

  // Static methods to access the variables
  static Color getPrimaryColorLight() => kPrimaryColorLight;
  static Color getAccentColorLight() => kAccentColorLight;
  static Color getBackgroundColorLight() => kBackgroundColorLight;
  static Color getSurfaceColorLight() => kSurfaceColorLight;
  static Color getSecondaryColorLight() => kSecondaryColorLight;
  static Color getTextColorLight() => kTextColorLight;

  static Color getPrimaryColorDark() => kPrimaryColorDark;
  static Color getAccentColorDark() => kAccentColorDark;
  static Color getBackgroundColorDark() => kBackgroundColorDark;
  static Color getSurfaceColorDark() => kSurfaceColorDark;
  static Color getSecondaryColorDark() => kSecondaryColorDark;
  static Color getTextColorDark() => kTextColorDark;

  static double getFixPadding() => fixPadding;

  static TextStyle getBlackSemiBold24() => blackSemiBold24;
  static TextStyle getBlackSemiBold22() => blackSemiBold22;
  static TextStyle getDustyGrayMedium16() => dustyGrayMedium16;
  static TextStyle getBlackRegular16() => blackRegular16;
  static TextStyle getBlackRegular14() => blackRegular14;
  static TextStyle getWhiteTypeMedium14() => whiteTypeMedium14;
  static TextStyle getWhiteTypeSemiBold16() => whiteTypeSemiBold16;
  static TextStyle getWhiteSemiBold16() => whiteSemiBold16;
  static TextStyle getWhiteRegular16() => whiteRegular16;
  static TextStyle getWhiteSemiBold14() => whiteSemiBold14;
  static TextStyle getWhiteSemiBold10() => whiteSemiBold10;
  static TextStyle getWhiteTypeSemiBold14() => whiteTypeSemiBold14;
  static TextStyle getBlackBold16() => blackBold16;
  static TextStyle getBlackBold18() => blackBold18;
  static TextStyle getWhiteBold22() => whiteBold22;
  static TextStyle getPinputShadowRegular16() => pinputShadowRegular16;
  static TextStyle getPinputShadowSemiBold16() => pinputShadowSemiBold16;
  static TextStyle getPinputShadowSemiBold18() => pinputShadowSemiBold18;
  static TextStyle getPinputShadowSemiBold14() => pinputShadowSemiBold14;
  static TextStyle getPinputShadowSemiBold15() => pinputShadowSemiBold15;
  static TextStyle getPinputShadowSemiBold12() => pinputShadowSemiBold12;
  static TextStyle getPinputShadowRegular14() => pinputShadowRegular14;
  static TextStyle getPinputShadowMedium14() => pinputShadowMedium14;
  static TextStyle getPinputShadowMedium16() => pinputShadowMedium16;
  static TextStyle getPinputShadowMedium12() => pinputShadowMedium12;
  static TextStyle getDustyGrayRegular14() => dustyGrayRegular14;
  static TextStyle getDustyGrayRegular16() => dustyGrayRegular16;
  static TextStyle getWhiteBold16() => whiteBold16;
  static TextStyle getBlackSemiBold16() => blackSemiBold16;
  static TextStyle getBlackMedium16() => blackMedium16;
  static TextStyle getBlackMedium18() => blackMedium18;
  static TextStyle getBlackMedium14() => blackMedium14;
  static TextStyle getBlackMedium12() => blackMedium12;
  static TextStyle getWhiteMedium14() => whiteMedium14;
  static TextStyle getBlackSemiBold18() => blackSemiBold18;
  static TextStyle getBlackSemiBold20() => blackSemiBold20;
  static TextStyle getBlackShadowSemiBold16() => blackShadowSemiBold16;
  static TextStyle getDustyGraySemiBold16() => dustyGraySemiBold16;
  static TextStyle getWhiteSemiBold18() => whiteSemiBold18;
  static TextStyle getBlackSemiBold14() => blackSemiBold14;
  static TextStyle getDeepTealSemiBold16() => deepTealSemiBold16;
  static TextStyle getDeepTealSemiBold18() => deepTealSemiBold18;
  static TextStyle getDeepTealSemiBold15() => deepTealSemiBold15;
  static TextStyle getDeepTealSemiBold30() => deepTealSemiBold30;
  static TextStyle getDeepTealSemiBold24() => deepTealSemiBold24;
  static TextStyle getDeepTealSemiBold14() => deepTealSemiBold14;
  static TextStyle getDeepTealRegular16() => deepTealRegular16;
  static TextStyle getDeepTealMedium16() => deepTealMedium16;
  static TextStyle getDeepTealMedium14() => deepTealMedium14;
  static TextStyle getDeepTealBold16() => deepTealBold16;
  static TextStyle getDeepTealBold14() => deepTealBold14;
  static TextStyle getNobelSemiBold14() => nobelSemiBold14;
  static TextStyle getNobelMedium16() => nobelMedium16;
  static TextStyle getUniCode1() => uniCode1;
  static TextStyle getUniCode2() => uniCode2;
}
