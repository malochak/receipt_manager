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
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(app_colors.accentColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
          onPressed: onPressed
        );
}
