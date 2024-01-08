import '../../core/constant/string.constants.dart';

class BaseValidate {

  String? limitWords(String value) {
    if (value.length >= 70) {
      return 'Maksimal judul';
    }
    return null;
  }
  String? emptyValidation(String value) {
    if (value.isEmpty) {
      return Strings.EMPTY_FIELD_ERROR;
    }
    return null;
  }

  
}
