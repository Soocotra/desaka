
import 'package:desaka/domain/shared/usecases/validate_empty.dart';
import 'package:get/get.dart';

import '../../core/constant/string.constants.dart';

class ValidatePassword {

  String? execute(String value){
    String? emptyResult = ValidateEmpty().execute(value);

    if(emptyResult != null){
      return emptyResult;
    }
  }

}