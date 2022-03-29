import 'package:flutter/material.dart';
import 'package:receipt_manager/components/forms/registration_form.dart';

import '../components/app_bar_text.dart';
import '../constants/app_colors.dart' as app_colors;

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.backgroundColor,
      appBar: AppBar(
          backgroundColor: app_colors.darkBackgroundColor,
          title: const AppBarText('Rejestracja')),
      body: const Center(child: RegistrationForm()),
    );
  }
}
