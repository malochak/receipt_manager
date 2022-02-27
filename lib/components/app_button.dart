import 'package:flutter/material.dart';
import '../constants/app_colors.dart' as app_colors;
import 'basic_text.dart';

class AppButton extends TextButton {
  AppButton(String label, VoidCallback? onPressed, {Key? key})
      : super(
          key: key,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
            child: BasicText(label),
          ),
          onPressed: onPressed
        );
}
