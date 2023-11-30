import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      // color: Color.fromARGB(255, 13, 24, 34)
      //color: scaffoldBackground
      iconTheme: IconThemeData(color: Colors.blue)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Color.fromARGB(255, 31, 45, 151),
          backgroundColor: const Color.fromARGB(255, 1, 13, 100),
          foregroundColor: Colors.white)),
  scaffoldBackgroundColor: scaffoldBackground,
  primaryColorDark: const Color.fromARGB(255, 3, 28, 49),
  // colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 21, 36)),
  iconTheme: const IconThemeData(color: const Color.fromARGB(255, 1, 13, 100)),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(fontSize: 14)),
);

final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)));
