import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receipt_manager/screens/login_screen.dart';
import 'package:receipt_manager/screens/registration_screen.dart';

import '../components/app_bar_text.dart';
import '../components/app_button.dart';
import '../constants/app_colors.dart' as app_colors;
import '../main.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: app_colors.darkBackgroundColor,
            title: AppBarText(MyApp.appTitle, font: 'Pacifico')),
        body: SafeArea(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 140, horizontal: 15),
              // todo : make the border responsive
              child: DottedBorder(
                strokeWidth: 1,
                dashPattern: const [6, 9],
                color: app_colors.textColor,
                borderType: BorderType.RRect,
                radius: const Radius.circular(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton('Logowanie', () {
                      print('Login');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()));
                    }),
                    const SizedBox(height: 30),
                    AppButton('Rejestracja', () {
                      print('Registration');
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                    }),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                iconSize: 40.0,
                                color: app_colors.textColor,
                                onPressed: () {
                                  print('Apple icon');
                                },
                                icon: const FaIcon(FontAwesomeIcons.apple)),
                            IconButton(
                                iconSize: 40.0,
                                color: app_colors.textColor,
                                onPressed: () {
                                  print('Google icon');
                                },
                                icon: const FaIcon(FontAwesomeIcons.google))
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
