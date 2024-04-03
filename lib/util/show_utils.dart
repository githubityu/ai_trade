import 'package:ai_trade/util/export_util.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../exports.dart';
import '../gen/export_gen.dart';
import '../local/constants.dart';
import '../providers/export_providers.dart';

class ShowUtils {
  static String showSafeString(String? data) {
    return data ?? '';
  }

  static String getPath(String? path) {
    return path?.startsWith("/") == true ? path! : "/$path";
  }

  static double showNum(double? data) {
    if (data == null) {
      return 0;
    }
    return data.floorToDouble();
  }


  static Widget getIcon(String? name) {
    return name == null
        ? const SizedBox.shrink()
        : ImageIcon(
            AssetGenImage('assets/images/${name == "404" ? "x404" : name}.png')
                .image()
                .image,
            size: 18,
          );
  }

  static String showLineStr(String? data) {
    return "${showSafeString(data)}\n";
  }

  static int geThemeIndex(ThemeMode themeMode) {
    return themeMode.index - 1;
  }

  static ThemeMode updateTheme() {
    final modelType = SpUtil.getBool(Constants.appTheme, defValue: true);
    SpUtil.putBool(Constants.appTheme, !modelType);
    return !modelType ? ThemeMode.light : ThemeMode.dark;
  }

  static String updateFee(String fee,{bool isBuyFee = false}) {
    final key = isBuyFee ? Constants.buyFee : Constants.sellFee;
    SpUtil.putString(key, fee);
    return fee;
  }
  static  String removeInvalidZeros(Decimal value) {
    return value.formatWith(NumberFormat("#.##"));
  }

  static String toPercent(Decimal value,{bool isMul = true}){
    return "${ShowUtils.removeInvalidZeros(value*d(isMul?"100":"1"))}%";
  }

  static String withU(dynamic num){
    if(num is Decimal){
      return "${removeInvalidZeros(num)} ${Constants.U}";
    }else{
      return "${removeInvalidZeros(d("$num"))} ${Constants.U}";
    }
  }

  static String getFee({bool isBuyFee = false}) {
    final key = isBuyFee ? Constants.buyFee : Constants.sellFee;
    return SpUtil.getString(key, defValue: "0.1");
  }


  static ThemeMode getThemeMode() {
    return SpUtil.getBool(Constants.appTheme, defValue: true)
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  static String updateLocation(LanguageType index) {
    SpUtil.putString(Constants.localChange, index.type);
    return index.type;
  }

  static String getLocation() {
    return SpUtil.getString(Constants.localChange,
        defValue: LanguageType.ZH_TYPE.type);
  }

}
