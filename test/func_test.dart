// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ai_trade/models/coin_model.dart';
import 'package:ai_trade/util/app_utils.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ai_trade/main.dart';
import 'package:isar/isar.dart';

void main() {
  test('Counter increments smoke test', ()  async {
    final rate = ((d("70000")-d("69000"))/d("69000")).toDecimal(scaleOnInfinitePrecision: 3);
    print("rate=${rate.toDouble()}");
  });
}
