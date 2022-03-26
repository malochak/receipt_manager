extension StringExtension on String {
  bool isValidEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  bool containsAtLeastOneLetter() =>
    contains(RegExp(r'[a-zA-Z]'));

  bool containsAtLeastOneUppercaseLetter() =>
      contains(RegExp(r'[A-Z]'));

  bool containsAtLeastOneNumber() => contains(RegExp(r'[0-9]'));

  bool containsAtLeastOneSpecialCharacter() =>
      contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}
