import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receipt_manager/components/app_button.dart';
import 'package:receipt_manager/components/validators/validation_chain.dart';
import 'package:receipt_manager/components/validators/validations.dart';

import '../../constants/app_colors.dart' as app_colors;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final ValidationChain emailFieldValidation =
      ValidationChain("E-mail", [NotEmptyValidation(), EmailValidation()]);
  final ValidationChain passwordFieldValidation = ValidationChain("Hasło", [
    NotEmptyValidation(),
    LengthValidation(8),
    ContainsLetterValidation(),
    ContainsUppercaseLetterValidation(),
    ContainsNumberValidation(),
    SpecialCharacterValidation()
  ]);

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
                validator: (value) => emailFieldValidation.validate(value!),
                style: const TextStyle(
                    color: app_colors.textColor, fontSize: 16.0),
                decoration: const InputDecoration(
                    prefixIcon: FaIcon(FontAwesomeIcons.at)),
              ),
              const SizedBox(height: 30),
              TextFormField(
                validator: (value) => passwordFieldValidation.validate(value!),
                obscureText: true,
                style: const TextStyle(
                    color: app_colors.textColor, fontSize: 16.0),
                decoration: const InputDecoration(
                  prefixIcon: FaIcon(
                    FontAwesomeIcons.key,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: AppButton('Zaloguj się', () {
                  if (_formKey.currentState!.validate()) {
                    print('Login action - form valid');
                  } else {
                    print('Login action - form INVALID');
                  }
                }),
              )
            ],
          ),
        ));
  }
}
