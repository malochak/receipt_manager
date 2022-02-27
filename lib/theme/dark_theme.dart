import 'package:flutter/material.dart';

import '../constants/app_colors.dart' as app_colors;

class DarkTheme {
  static get getInstance => ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      scaffoldBackgroundColor: app_colors.backgroundColor,
      textTheme: const TextTheme(

      ),
      fontFamily: 'Lato',
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(app_colors.accentColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
      )));
}
