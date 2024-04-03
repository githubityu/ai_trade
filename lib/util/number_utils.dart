import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

/// Num Util.
class NumUtils {

  /// 加 (精确相加,防止精度丢失).
  static double add(num a, num b) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return (d1 + d2).toDouble();
  }



  /// 加 (精确相加,防止精度丢失).四舍五入保留指定位数小数
  static String addStr(num a, num b, int digits) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return (d1 + d2).toDouble().toStringAsFixed(digits);
  }

  /// 减 (精确相减,防止精度丢失).
  static double subtract(num a, num b) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return (d1 - d2).toDouble();
  }

  /// 减 (精确相减,防止精度丢失).四舍五入保留指定位数小数
  static String subtractStr(num a, num b, int digits) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return (d1 - d2).toDouble().toStringAsFixed(digits);
  }

  /// 乘 (精确相乘,防止精度丢失).
  static double multiply(num a, num b) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return (d1 * d2).toDouble();
  }

  /// 乘 (精确相乘,防止精度丢失).四舍五入保留指定位数小数
  static String multiplyStr(num a, num b, int position) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return (d1 * d2).toDouble().toStringAsFixed(position);
  }

  /// 除 (精确相除,防止精度丢失).
  static double divide(num a, num b) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return (d1 / d2).toDouble();
  }

  /// 余数
  static Decimal remainder(num a, num b) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return d1 % d2;
  }

  /// 除 (精确相除,防止精度丢失).保留几位小数，返回String
  static String divideStrNum(num a, num b, int digits) {
    return divideDecStr((a).toString(), (b).toString())
        .toStringAsFixed(digits);
  }

  /// 除 (精确相除,防止精度丢失).保留几位小数，返回String
  static String divideStrStr(String a, String b, int digits) {
    return divideDecStr(a, b).toStringAsFixed(digits);
  }

  /// 四舍五入(精确相除,防止精度丢失).保留几位小数，返回String
  static String toStringAsFixed(num a, int digits) {
    return Decimal.parse((a).toString()).toStringAsFixed(digits);
  }

  /// 四舍五入(精确相除,防止精度丢失).保留几位小数，返回String
  static String toStringAsFixedStr(String a, int digits) {
    return Decimal.parse(a).toStringAsFixed(digits);
  }

  /// 除
  static Decimal divideDecStr(String a, String b) {
    return (Decimal.parse(a) / Decimal.parse(b)).toDecimal();
  }

  /// Relational less than operator.
  static bool lessThan(num a, num b) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return d1 < d2;
  }

  /// Relational less than or equal operator.
  static bool thanOrEqual(num a, num b) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return d1 <= d2;
  }

  /// Relational greater than operator.
  static bool greaterThan(num a, num b) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return d1 > d2;
  }

  /// Relational greater than or equal operator.
  static bool greaterOrEqual(num a, num b) {
    Decimal d1 = Decimal.parse(a.toString());
    Decimal d2 = Decimal.parse(b.toString());
    return d1 >= d2;
  }
}

