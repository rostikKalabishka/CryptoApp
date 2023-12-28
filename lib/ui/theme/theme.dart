import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';

enum AppTheme { darkTheme, lightTheme }

final darkTheme = ThemeData.dark().copyWith(
  cardColor: splineColor.withAlpha(100),
  dividerColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: splineColor),
  indicatorColor: accentColor,
  tabBarTheme: const TabBarTheme(unselectedLabelColor: Colors.white),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    color: scaffoldBackground,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        disabledBackgroundColor: const Color.fromARGB(255, 31, 45, 151),
        backgroundColor: const Color.fromARGB(255, 1, 13, 100),
        foregroundColor: Colors.white),
  ),
  scaffoldBackgroundColor: scaffoldBackground,
  primaryColor: splineColor,
  iconTheme: const IconThemeData(color: Color.fromARGB(255, 1, 13, 100)),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: scaffoldBackground),
  hintColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(fontSize: 14),
    labelMedium: TextStyle(fontSize: 20),
  ),
  dialogBackgroundColor: splineColor,
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: Colors.white),
  ),
);

final lightTheme = ThemeData.light().copyWith(
  cardColor: Colors.grey,
  dialogBackgroundColor: Colors.grey,
  dividerColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(seedColor: splineColor),
  hintColor: Colors.black,
  tabBarTheme: const TabBarTheme(unselectedLabelColor: Colors.black),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.grey[300],
        backgroundColor: Colors.grey[500],
        foregroundColor: Colors.black45),
  ),
  scaffoldBackgroundColor: Colors.white,
  indicatorColor: const Color.fromARGB(255, 9, 31, 172),
  primaryColor: Colors.white12,
  iconTheme: const IconThemeData(color: Colors.black),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.grey, unselectedItemColor: Colors.black),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
    bodySmall: TextStyle(fontSize: 14, color: Colors.black),
    labelMedium: TextStyle(fontSize: 20, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: Colors.black),
  ),
);
