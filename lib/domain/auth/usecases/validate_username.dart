
import 'package:desaka/domain/shared/usecases/validate_empty.dart';


class ValidateUsername {

  String? execute(String value){
    String? emptyResult = ValidateEmpty().execute(value);

    if(emptyResult != null){
      return emptyResult;
    }
    return null;
  }

}