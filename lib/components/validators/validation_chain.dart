import 'package:receipt_manager/components/validators/validateable.dart';
import 'package:collection/collection.dart';

class ValidationChain {
  final List<Validateable> validations;
  final String fieldName;

  ValidationChain(this.fieldName, this.validations) {
    for (var validation in validations) {
      validation.setSubjectName(fieldName);
    }
  }

  String? validate(String value) {
    return validations
        .firstWhereOrNull((rule) => !rule.validate(value))
        ?.getMessage();
  }
}
