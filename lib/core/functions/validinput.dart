import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Can't be empty";
  } 
 
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return "Enter a valid username";
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "Enter a valid email";
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Enter a valid phone number";
    }
  }
 
  if (val.length < min) {
    return "Enter at least $min characters";
  }
  if (val.length > max) {
    return "Enter at most $max characters";
  }
}
