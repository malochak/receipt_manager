import 'package:flutter/material.dart';

import '../constants/app_colors.dart' as app_colors;

class AppBarText extends Text {
  AppBarText(String data, {Key? key, String font = 'Lato'})
      : super(
          data,
          key: key,
          style: TextStyle(
              color: app_colors.textColor, fontSize: 24.0, fontFamily: font),
        );
}
