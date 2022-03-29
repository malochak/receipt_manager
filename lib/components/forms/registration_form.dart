import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receipt_manager/components/app_button.dart';
import 'package:receipt_manager/model/user.dart';
import 'package:receipt_manager/validators/validation_chain.dart';
import 'package:receipt_manager/validators/validations.dart';

import '../../constants/app_colors.dart' as app_colors;

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationForm createState() => _RegistrationForm();
}

class _RegistrationForm extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  User user = User("", "");

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
                onChanged: (value) => user.email = value,
                validator: (value) => emailFieldValidation.validate(value!),
                style: const TextStyle(
                    color: app_colors.textColor, fontSize: 16.0),
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  prefixIcon: FaIcon(FontAwesomeIcons.at, size: 20),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                onChanged: (value) => user.password = value,
                validator: (value) => passwordFieldValidation.validate(value!),
                obscureText: true,
                style: const TextStyle(
                    color: app_colors.textColor, fontSize: 16.0),
                decoration: const InputDecoration(
                  labelText: "Hasło",
                  prefixIcon: FaIcon(FontAwesomeIcons.key, size: 20),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                obscureText: true,
                validator: (value) => user.validatePasswordMatching(value!),
                style: const TextStyle(
                    color: app_colors.textColor, fontSize: 16.0),
                decoration: const InputDecoration(
                  labelText: "Potwierdzenie Hasła",
                  prefixIcon: FaIcon(FontAwesomeIcons.key, size: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: AppButton('Zarejestruj się', () {
                  if (_formKey.currentState!.validate()) {
                    print('Register action - form valid');
                  } else {
                    print('Register action - form INVALID');
                  }
                }),
              )
            ],
          ),
        ));
  }
}
