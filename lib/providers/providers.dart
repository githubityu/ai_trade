import 'package:flutter/material.dart';
import 'package:ai_trade/exports.dart';

import '../theme/app_theme.dart';
import '../util/export_util.dart';

///读取属性
///展示数据用watch
///修改用read.notifier
//


enum LanguageType {
  ZH_TYPE('zh'),
  EN_TYPE('en');

  final String type;

  const LanguageType(this.type);
}

final loadingStateProvider = Provider<LoadingStateViewModelDialog>(
    (ref) => LoadingStateViewModelDialog());

final appThemeModeProvider = StateProvider(
      (ref) => ShowUtils.getThemeMode(),
);





//
final appThemeProvider = Provider<ThemeData>(
  (ref) {
    final mode = ref.watch(appThemeModeProvider);
    switch (mode) {
      case ThemeMode.dark:
        return AppTheme.darkThemeData;
      case ThemeMode.light:
        return AppTheme.lightThemeData;
      default:
        return AppTheme.lightThemeData;
    }
  },
);
