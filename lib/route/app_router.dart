import 'package:ai_trade/models/export_models.dart';
import 'package:ai_trade/ui/ai_model_history_page.dart';
import 'package:ai_trade/ui/ai_model_page.dart';
import 'package:ai_trade/ui/buy_page.dart';
import 'package:ai_trade/ui/sell_page.dart';
import 'package:ai_trade/ui/setting_page.dart';
import 'package:ai_trade/ui/trade_history_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_trade/exports.dart';
import 'package:ai_trade/ui/common/common_export.dart'
    deferred as common_export;
import 'package:ai_trade/ui/main_page.dart';

import '../ui/input_cost_page.dart';
import 'export_route.dart';
import 'my_nav_observer.dart';

///search_page删除跳转
class RoutePath {
  RoutePath._();

  static const String splash = '/splash';
  static const String webPage = '/webPage';
  static const String mainPage = '/mainPage';
  static const String buyPage = '/buyPage';
  static const String sellPage = '/sellPage';
  static const String settingPage = '/settingPage';
  static const String tradeHistoryPage = '/tradeHistoryPage';
  static const String aiModelHistoryPage = '/aiModelHistoryPage';
  static const String aiModelPage = '/aiModelPage';
  static const String updateFeePage = '/updateFeePage';
  static const String inputConstPage = '/inputConstPage';

  static const List<String> needLoginPages = [];
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter goRouter = GoRouter(
    observers: [FlutterSmartDialog.observer, MyNavObserver()],
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
          path: RoutePath.mainPage,
          builder: (context, state) {
            return const MainPage();
          }),
      GoRoute(
          path: RoutePath.buyPage,
          builder: (context, state) {
            return const BuyPage();
          }),
      GoRoute(
          path: RoutePath.sellPage,
          builder: (context, state) {
            return SellPage(coinBuyModel: state.extra as CoinBuyModel);
          }),
      GoRoute(
          path: RoutePath.settingPage,
          builder: (context, state) {
            return const SettingPage();
          }),
      GoRoute(
          path: RoutePath.tradeHistoryPage,
          builder: (context, state) {
            return const TradeHistoryPage();
          }),
      GoRoute(
          path: RoutePath.inputConstPage,
          builder: (context, state) {
            return const InputConstPage();
          }),
      GoRoute(
          path: RoutePath.aiModelHistoryPage,
          builder: (context, state) {
            return AiModelHistoryPage(
              params: state.extra as RequestParamsAiRecord,
            );
          }),
      GoRoute(
          path: RoutePath.updateFeePage,
          builder: (context, state) {
            return UpdateFeePage(
              isBuyFee: state.extra as bool,
            );
          }),
      GoRoute(
          path: RoutePath.aiModelPage,
          builder: (context, state) {
            return AiModelPage(coinBuyModel: state.extra as CoinBuyModel);
          }),
      GoRoute(
          path: RoutePath.webPage,
          builder: (context, state) {
            final result = state.extra as ParamsWebPage;
            return DeferredWidget(
                common_export.loadLibrary, () => common_export.WebPage(result));
          }),
    ],
    redirect: (context, state) async {},
    debugLogDiagnostics: true,
    initialLocation: RoutePath.mainPage);

extension GoRouterX on GoRouter {
  Future<T?> pushAndRemoveUntilX<T extends Object?>(
      String location, String popUtil,
      {Object? extra}) {
    routerDelegate.navigatorKey.currentState
        ?.popUntil(ModalRoute.withName(popUtil));
    return push(location, extra: extra);
  }

  //
  void popUntil(String location) {
    routerDelegate.navigatorKey.currentState
        ?.popUntil(ModalRoute.withName(location));
  }

  void singTopPush(String location, {Object? extra}) {
    pushReplacement(location, extra: extra);
  }

  bool hasLocation(String location) {
    return routerDelegate.currentConfiguration.matches
            .firstWhereOrNull((element) {
          return element.matchedLocation.contains(location);
        }) !=
        null;
  }
}
