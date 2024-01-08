import 'package:desaka/domain/shared/usecases/validate_empty.dart';

class ValidatePassword {
  String? execute(String value) {
    String? emptyResult = BaseValidate().emptyValidation(value);

    if (emptyResult != null) {
      return emptyResult;
    }
    return null;
  }
}
