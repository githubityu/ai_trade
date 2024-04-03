import 'dart:math' as math;

import 'package:ai_trade/exports.dart';
import 'package:ai_trade/util/show_utils.dart';
import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../local/constants.dart';
import '../models/export_models.dart';
import 'extension/simple_extension.dart';

class AppUtils {
  static double getDoubleByString(String? data) {
    if (data == null) {
      return 0;
    }
    return double.parse(data);
  }

  static String parseNum(String? num2) {
    if (num2 != null) {
      final numParse = num.tryParse(num2);
      return numParse == null ? "0" : numParse.toString();
    } else {
      return "0";
    }
  }

  static bool isNumeric(String value) {
    return num.tryParse(value) != null;
  }

  ///买的计算
  static ({Decimal feeNum, Decimal resultNum}) calculateFee(String num2) {
    final num = parseNum(num2);
    ///手续费
    final feeNum = (d(num) *
            d(ShowUtils.getFee()) /
            d(Constants.FEE))
        .toDecimal();

    ///实际持仓量
    final resultNum = d(num) - feeNum;
    return (
      feeNum:feeNum,
      resultNum: resultNum
    );
  }



  static Decimal calculateU(String price2, String num2) {
    final num = parseNum(num2);
    final price = parseNum(price2);
    final buyU = d(price) * d(num);
    return buyU;
  }

  ///计算收益率 (卖的价格-买的价格)*卖的数量
  ///卖的价格-买的价格/买的价格
  static ({Decimal rate, Decimal rateNum}) calculateRate(String? buyPrice2, String? sellPrice2,String? sellNum2) {
    if(sellPrice2==null||sellPrice2=="0"||sellPrice2.isNullOrEmpty){
      return (rate:d("0"),rateNum:d("0"));
    }
    final buyPrice = parseNum(buyPrice2);
    final sellPrice = parseNum(sellPrice2);
    final sellNum = parseNum(sellNum2);
    final rate = ((d(sellPrice)-d(buyPrice))/d(buyPrice)).toDecimal(scaleOnInfinitePrecision:8);
    final rateNum =d(sellNum)*(d(sellPrice)-d(buyPrice));
    return (rate:rate,rateNum:rateNum);
  }


  
  
  static double roundHalfDown(Decimal value, {int decimalPlaces = 8}) {
    final double scale = math.pow(10, decimalPlaces).toDouble();
    final double scaledValue = value.toDouble() * scale;
    final d = scaledValue.truncate() / scale;
    return d;
  }


}
