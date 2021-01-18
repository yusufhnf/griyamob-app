import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/utils/strings.dart';

class Validation {
  final StringFormat _format = StringFormat();
  String validateEmail(String value) {
    if (value != '' && !value.contains('@')) {
      return Strings.responEmailTidakValid;
    } else if (value == '') {
      return Strings.responEmailKosong;
    }
    return null;
  }

  String validatePassword(String value) {
    if (value != '' && value.length <= 8) {
      return Strings.responPasswordKurang;
    } else if (value == '') {
      return Strings.responPasswordKosong;
    }
    return null;
  }

  String validatePhone(String value) {
    if (value != '' && value[0] != '8') {
      return Strings.responPhoneSalah;
    } else if (value == '') {
      return Strings.responPhoneKosong;
    }
    return null;
  }

  String validateName(String value) {
    if (value == '') {
      return Strings.responNameKosong;
    }
    return null;
  }

  String validateNominal(String value, int saldo) {
    int convertValue = int.parse(_format.getNumberOnly(value));
    if (convertValue < 10000) {
      return Strings.responNominalMin;
    }
    return null;
  }
}
