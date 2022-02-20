import 'package:flutter/material.dart';
import 'package:receipt_manager/screens/landing_screen.dart';

import 'constants/app_colors.dart' as app_colors;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const _appTitle = 'Paragonik';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
          backgroundColor: app_colors.backgroundColor,
          appBar: AppBar(
            backgroundColor: app_colors.darkBackgroundColor,
            title: const AppbarText(_appTitle),
          ),
          body: const LandingScreen()),
    );
  }
}

class AppbarText extends Text {
  const AppbarText(String data, {Key? key})
      : super(
          data,
          key: key,
          style: const TextStyle(
              color: app_colors.textColor,
              fontSize: 24.0,
              fontFamily: 'Pacifico'),
        );
}
