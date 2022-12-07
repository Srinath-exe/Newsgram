import 'dart:developer';

String capitalize(String? value) {
  if (value == null) {
    log("I SEE");
    return "";
  }
  if (value.length > 0) {
    var result = value[0].toUpperCase();
    bool cap = true;
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " " && cap == true) {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
        cap = false;
      }
    }
    return result;
  }
  return value;
}
