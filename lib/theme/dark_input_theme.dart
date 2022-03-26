import 'package:flutter/material.dart';
import '../constants/app_colors.dart' as app_colors;

class DarkInputTheme {
  InputDecorationTheme theme() => const InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),
      border: UnderlineInputBorder(
          borderSide: BorderSide(color: app_colors.border)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: app_colors.border_focused)),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: app_colors.border)),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: app_colors.border_error)),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: app_colors.border_focused_error)),
      disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: app_colors.border_disabled)));
}
