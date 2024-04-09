import 'package:flutter/services.dart';

class MinMaxValueFormatter extends TextInputFormatter {
  final double minValue;
  final double maxValue;

  MinMaxValueFormatter({required this.minValue, required this.maxValue});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    double? newValueParsed = double.tryParse(newValue.text);
    if (newValueParsed != null) {
      if (newValueParsed < minValue || newValueParsed > maxValue) {
        return oldValue;
      }
    }
    return newValue;
  }
}