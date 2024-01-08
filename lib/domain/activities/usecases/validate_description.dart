import '../../shared/usecases/validate_empty.dart';

class ValidateDescription {
  String? execute(String? value) {
    final limit = BaseValidate().limitWords(value ?? "");
    if (limit != null) {
      return limit;
    }
    return null;
  }
}
