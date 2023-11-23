import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
    scaffoldBackgroundColor: scaffoldBackground);

final lightTheme = ThemeData.light();
