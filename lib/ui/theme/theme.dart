import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
    // color: Color.fromARGB(255, 13, 24, 34)
    //color: scaffoldBackground
  ),
  scaffoldBackgroundColor: scaffoldBackground,
  primaryColorDark: Color.fromARGB(255, 3, 28, 49),
  // colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 21, 36)),
);

final lightTheme = ThemeData.light();
