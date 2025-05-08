import 'package:common_utils/constant/reg_exp_pattern.dart';
import 'package:flutter/services.dart';

class DoubleFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final value = RegExpPatterns.doubleRegExp.hasMatch(newValue.text);
    if (value) {
      return newValue;
    }
    return oldValue;
  }
}
