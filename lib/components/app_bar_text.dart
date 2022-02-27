import 'package:flutter/material.dart';
import '../constants/app_colors.dart' as app_colors;

class AppBarText extends Text {
  const AppBarText(String data, {Key? key})
      : super(
    data,
    key: key,
    style: const TextStyle(
        color: app_colors.textColor,
        fontSize: 24.0,
        fontFamily: 'Pacifico'),
  );
}