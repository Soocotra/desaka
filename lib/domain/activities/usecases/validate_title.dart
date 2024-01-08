import '../../shared/usecases/validate_empty.dart';

class ValidateTitle {
  String? execute(String? value) {
    final empty = BaseValidate().emptyValidation(value ?? "");
    final limit = BaseValidate().limitWords(value ?? "");
    if (empty != null) {
      return empty;
    }
    if (limit != null) {
      return limit;
    }
    return null;
  }
}
