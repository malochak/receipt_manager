import 'package:flutter/material.dart';
import 'package:receipt_manager/screens/landing_screen.dart';

import 'constants/app_colors.dart' as app_colors;
import 'theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const appTitle = 'Paragonik';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const LandingScreen(),
      theme: DarkTheme.getInstance,
    );
  }
}
