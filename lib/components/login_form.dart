import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receipt_manager/components/app_button.dart';

import '../constants/app_colors.dart' as app_colors;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                style: const TextStyle(
                    color: app_colors.textColor, fontSize: 16.0),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    prefixIcon: FaIcon(FontAwesomeIcons.at)),
              ),
              const SizedBox(height: 30),
              TextFormField(
                style: const TextStyle(
                    color: app_colors.textColor, fontSize: 16.0),
                decoration: InputDecoration(
                  prefixIcon: FaIcon(
                    FontAwesomeIcons.key,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: AppButton('Zaloguj się', () {
                  print('Login action');
                }),
              )
            ],
          ),
        ));
  }
}
