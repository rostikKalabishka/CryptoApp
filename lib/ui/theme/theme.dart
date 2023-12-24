import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';

enum AppTheme { darkTheme, lightTheme }

final darkTheme = ThemeData.dark().copyWith(
  cardColor: splineColor.withAlpha(100),
  colorScheme: ColorScheme.fromSeed(seedColor: splineColor),
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      color: scaffoldBackground,
      iconTheme: IconThemeData(color: Colors.blue)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          disabledBackgroundColor: const Color.fromARGB(255, 31, 45, 151),
          backgroundColor: const Color.fromARGB(255, 1, 13, 100),
          foregroundColor: Colors.white)),
  scaffoldBackgroundColor: scaffoldBackground,
  primaryColorDark: splineColor,
  // colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 21, 36)),
  iconTheme: const IconThemeData(color: Color.fromARGB(255, 1, 13, 100)),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: scaffoldBackground),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(fontSize: 14),
      labelMedium: TextStyle(fontSize: 20)),
);

final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)));
