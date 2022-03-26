import 'package:flutter/material.dart';
import 'package:receipt_manager/theme/dark_input_theme.dart';

import '../constants/app_colors.dart' as app_colors;

class DarkTheme {
  TextButtonThemeData _buildButtonTextTheme() => TextButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(app_colors.accentColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
      ));

  ThemeData theme() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: app_colors.accentColor,
      primarySwatch: app_colors.primarySwatchMaterial,
      scaffoldBackgroundColor: app_colors.backgroundColor,
      textTheme: const TextTheme(), // todo - prepare own TextTheme
      fontFamily: 'Lato',
      textButtonTheme: _buildButtonTextTheme(),
      inputDecorationTheme: DarkInputTheme().theme()
  );
}
