import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receipt_manager/components/app_button.dart';
import 'package:receipt_manager/screens/receipts_screen.dart';
import 'package:receipt_manager/validators/validation_chain.dart';
import 'package:receipt_manager/validators/validations.dart';

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
                    labelText: "E-mail",
                    prefixIcon: FaIcon(FontAwesomeIcons.at, size: 20)),
              ),
              const SizedBox(height: 30),
              TextFormField(
                validator: (value) => passwordFieldValidation.validate(value!),
                obscureText: true,
                style: const TextStyle(
                    color: app_colors.textColor, fontSize: 16.0),
                decoration: const InputDecoration(
                  labelText: "Hasło",
                  prefixIcon: FaIcon(FontAwesomeIcons.key, size: 20),
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

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ReceiptsScreen()));
                }),
              )
            ],
          ),
        ));
  }
}
