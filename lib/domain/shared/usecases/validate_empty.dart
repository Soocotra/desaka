
import 'package:get/get.dart';

import '../../core/constant/string.constants.dart';

class ValidateEmpty {
  String? execute(String value) {
    if(value.isEmpty) {
      return Strings.EMPTY_FIELD_ERROR;
    }
  }
}