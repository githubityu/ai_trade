import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ai_trade/exports.dart';
import 'package:ai_trade/providers/export_providers.dart';
import 'package:ai_trade/theme/exports_theme.dart';
import 'package:ai_trade/util/export_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  await IsarUtils.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final appRouter = userAppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      theme: theme,
      darkTheme: AppTheme.darkThemeData,
      locale: ref.watch(appLocationProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: themeMode,
      title: 'AI Trade',
      builder: FlutterSmartDialog.init(),
      routerConfig: appRouter,
    );
  }
}
