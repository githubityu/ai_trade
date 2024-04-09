import 'dart:convert';
import 'dart:io';

import 'package:ai_trade/exports.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../local/constants.dart';
import '../models/export_models.dart';

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
    final feeNum =
        (d(num) * d(ShowUtils.getFee()) / d(Constants.FEE)).toDecimal();

    ///实际持仓量
    final resultNum = d(num) - feeNum;
    return (feeNum: feeNum, resultNum: resultNum);
  }

  static Decimal calculateU(String price2, String num2) {
    final num = parseNum(num2);
    final price = parseNum(price2);
    final buyU = d(price) * d(num);
    return buyU;
  }

  ///计算收益率 (卖的价格-买的价格)*卖的数量
  ///卖的价格-买的价格/买的价格
  static ({Decimal rate, Decimal rateNum}) calculateRate(
      String? buyPrice2, String? sellPrice2, String? sellNum2) {
    if (sellPrice2 == null || sellPrice2 == "0" || sellPrice2.isNullOrEmpty) {
      return (rate: d("0"), rateNum: d("0"));
    }
    final buyPrice = parseNum(buyPrice2);
    final sellPrice = parseNum(sellPrice2);
    final sellNum = parseNum(sellNum2);
    final rate = ((d(sellPrice) - d(buyPrice)) / d(buyPrice))
        .toDecimal(scaleOnInfinitePrecision: 8);
    final rateNum = d(sellNum) * (d(sellPrice) - d(buyPrice));
    return (rate: rate, rateNum: rateNum);
  }


  static PriceData calculatePriceData(CoinBuyModel item) {
    ///卖的
    final price = item.coinSellItems.fold(
        Decimal.zero,
            (previousValue, element) => (d("$previousValue") +
            calculateU(element.sellNum, element.sellPrice)));

    ///总资产
    final totalPrice =
        d("$price") + calculateU(ShowUtils.getPrice(item.coinName), item.balanceNum);
    ///总资产-总成本
    final inCome = totalPrice - calculateU(item.buyPrice, item.buyNum);
    return PriceData(totalPrice: totalPrice, inCome: inCome);
  }
  static PriceData calculateHearData(List<CoinBuyModel> items) {
    if (items.isEmpty) {
      return PriceData(totalPrice: d("0"), inCome: d("0"), inComeRate: d("0"));
    }
    ///获取每一个的成本，
    final priceData = items.map((e) => calculatePriceData(e)).toList();
    final totalPrice = priceData.fold(Decimal.zero,
        (previousValue, element) => (d("$previousValue") + element.totalPrice));
    final inCome = priceData.fold(Decimal.zero,
        (previousValue, element) => (d("$previousValue") + element.inCome));
    final rate = (inCome / totalPrice).toDecimal(scaleOnInfinitePrecision: 5);
    return PriceData(totalPrice: totalPrice, inCome: inCome, inComeRate: rate);
  }

  static Future parseJson() async {
    final message = await rootBundle.loadString("assets/json/coin.json");
    final List<dynamic> data = jsonDecode(message);
    List<CoinInfoModel> items = [];
    IsarUtils.write((isar){
      for (var element in data) {
        final coinModel = CoinInfoModel()..fullname = "${element["fullname"]}"..slug = "${element["slug"]}"..symbol = "${element["symbol"]}"..id = isar.coinInfoModels.autoIncrement();
        items.add(coinModel);
      }
      isar.coinInfoModels.putAll(items);
    });
  }

}
