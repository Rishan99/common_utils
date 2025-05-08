import 'dart:io';

import 'package:common_utils/constant/reg_exp_pattern.dart';

class Validators {
  Validators._();
  static String? emptyFieldValidator(String? value) => (value ?? "").trim().isEmpty ? "Field Required" : null;

  static String? urlFieldValidator(String? value) => (value ?? "").trim().isEmpty
      ? "Field Required"
      : RegExpPatterns.urlRegExp.hasMatch(value!)
          ? null
          : "Invalid Url";

  static String? emailValidator(String? value) => (value ?? "").trim().isEmpty
      ? "Field Required"
      : RegExpPatterns.emailRegExp.hasMatch(value!)
          ? null
          : "Invalid Email Address";
  static String? phoneNumberValidator(String? value, {int length = 10}) => (value ?? "").trim().isEmpty
      ? "Field Required"
      : value!.trim().length != 10
          ? "Phone number must be of $length digits"
          : null;

  static String? integerValidator(String? value) => (value ?? "").trim().isEmpty
      ? "Field Required"
      : (int.tryParse(value!.trim()) == null)
          ? "Invalid Value"
          : null;
  static String? doubleValidator(String? value) => (value ?? "").trim().isEmpty
      ? "Field Required"
      : (double.tryParse(value!.trim()) == null)
          ? "Invalid Value"
          : null;

  static String? dateTimeValidator(DateTime? value) => value == null ? "Field Required" : null;

  static String? dropDownFieldValidator(int? value) => (value ?? 0) < 1 ? "Field Required" : null;

  static Future<String?> fileSizeValidator(String value, int maxSize) async {
    final file = File(value);
    final fileSize = await file.length();
    // var decodedImage = await decodeImageFromList(file.readAsBytesSync());
    if (fileSize > maxSize) {
      return "The uploaded image must adhere to an Size Upto $maxSize MB";
    }
    return null;
  }
}
