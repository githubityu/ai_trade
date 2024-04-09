
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:ai_trade/exports.dart';
import 'package:ai_trade/models/export_models.dart';
import 'package:ai_trade/theme/exports_theme.dart';
import 'package:intl/intl.dart';
import 'package:decimal/intl.dart';

extension ResponseConverT on ResponseBodyMt {
  T? converterT<T>() {
    return MyJsonConverter.fromJsonAsT<T>(data);
  }
}

extension CancelTokenX on Ref {
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    return cancelToken;
  }
}

extension BuildContextExtension on BuildContext {
  AppLocalizations? get L => AppLocalizations.of(this);
  OtherTheme get extensions => OtherTheme.of(this);
}


extension ListExtension<T> on List<T> {
  void pad(int length, T value) {
    if (length > this.length) {
      addAll(List.filled(length - this.length, value));
    }
  }
}

extension DecimalX on Decimal {
  String formatWith(NumberFormat formatter) => formatter.format(DecimalIntl(this));
}

Decimal d(String s) => Decimal.parse(s);