import 'package:receipt_manager/utilities/string_extension.dart';
import 'package:receipt_manager/validators/FieldValidation.dart';
import 'package:receipt_manager/validators/validateable.dart';

class NotEmptyValidation extends FieldValidation implements Validateable {
  @override
  String getMessage() {
    String ending = fieldName!.endsWith("o") ? "puste" : "pusty";
    return '$fieldName nie może być $ending.';
  }

  @override
  bool validate(String value) {
    return value.isNotEmpty;
  }
}

class EmailValidation extends FieldValidation implements Validateable {
  @override
  String getMessage() {
    return '$fieldName jest niepoprawny';
  }

  @override
  bool validate(String value) {
    return value.isValidEmail();
  }
}

class LengthValidation extends FieldValidation implements Validateable {
  final int requiredLength;

  LengthValidation(this.requiredLength);

  @override
  String getMessage() {
    return '$fieldName musi zawierać przynajmniej $requiredLength znaków';
  }

  @override
  bool validate(String value) {
    return value.length >= requiredLength;
  }
}

class ContainsLetterValidation extends FieldValidation implements Validateable {
  @override
  String getMessage() {
    return '$fieldName musi zawierać przynajmniej jedną literę.';
  }

  @override
  bool validate(String value) {
    return value.containsAtLeastOneLetter();
  }
}

class ContainsUppercaseLetterValidation extends FieldValidation implements Validateable {
  @override
  String getMessage() {
    return '$fieldName musi zawierać przynajmniej jedną dużą literę.';
  }

  @override
  bool validate(String value) {
    return value.containsAtLeastOneUppercaseLetter();
  }
}

class ContainsNumberValidation extends FieldValidation implements Validateable {
  @override
  String getMessage() {
    return '$fieldName musi zawierać przynajmniej jedną cyfrę.';
  }

  @override
  bool validate(String value) {
    return value.containsAtLeastOneNumber();
  }
}

class SpecialCharacterValidation extends FieldValidation
    implements Validateable {
  @override
  String getMessage() {
    return '$fieldName musi zawierać przynajmniej jeden znak specjalny.';
  }

  @override
  bool validate(String value) {
    return value.containsAtLeastOneSpecialCharacter();
  }
}
