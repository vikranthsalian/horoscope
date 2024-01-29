import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class GlobalTheme {
  final globalTheme = ThemeData(
    colorScheme: _customColorScheme,
    fontFamily: 'Open Sans',
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      color: MetaColors.blackColor,
    )),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      // This will control the "back" icon
      iconTheme: IconThemeData(color: Colors.red),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: IconThemeData(color: Colors.black),
      centerTitle: false,
      elevation: 15,
      titleTextStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontFamily: 'Allison',
        fontSize: 40,
      ),
    ),
  );
}

ColorScheme _customColorScheme = ColorScheme(
  primary: MetaColors().primaryColor,
  secondary: MetaColors().secondaryColor,
  primaryContainer: Colors.black,
  secondaryContainer: Colors.black,
  surface: Colors.purpleAccent,
  background: Colors.white,
  error: Colors.black,
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  onSurface: Colors.black,
  onBackground: Colors.white,
  onError: Colors.redAccent,
  brightness: Brightness.light,
);
