import 'package:flutter/cupertino.dart';

import '../components/app_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton('Logowanie', () {
              print('logowanie');
            }),
            const SizedBox(height: 30),
            AppButton('Rejestracja', () {
              print('rejestracja');
            })
          ],
        ),
      ),
    );
  }
}
