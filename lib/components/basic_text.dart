import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart' as app_colors;

class BasicText extends Text {
  const BasicText(String data, {Key? key})
      : super(data,
      key: key,
      style:
      const TextStyle(color: app_colors.textColor, fontSize: 18.0));
}