import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ai_trade/exports.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(this.value,
      {Key? key,
      required this.asyncValueBuilder,
      this.isShowLoading = true,
      this.placeHolderWidget,
      this.errorWidget})
      : super(key: key);
  final AsyncValue<T?> value;
  final bool isShowLoading;
  final Widget Function(T?) asyncValueBuilder;
  final Widget? errorWidget;
  final Widget? placeHolderWidget;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: (T? value) => asyncValueBuilder(value),
        error: (error, _) {
          '$error=== $T'.log();
          return errorWidget ??
              Text(
                kDebugMode ? '$error $T' : 'Error',
                style: const TextStyle(color: Colors.red),
              );
        },
        loading: () => isShowLoading
            ? const LoadingWidget()
            : placeHolderWidget ?? const SizedBox.shrink());
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget(this.value,
      {Key? key,
      required this.asyncValueBuilder,
      this.isShowLoading = true,
      this.placeHolderWidget,
      this.errorWidget})
      : super(key: key);
  final AsyncValue<T?> value;
  final bool isShowLoading;
  final Widget Function(T?) asyncValueBuilder;
  final Widget? errorWidget;
  final Widget? placeHolderWidget;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: (T? value) => asyncValueBuilder(value),
        error: (error, _) {
          '$error=== $T'.log();
          return SliverToBoxAdapter(
            child: errorWidget ??
                Text(
                  kDebugMode ? '$error $T' : 'Error',
                  style: const TextStyle(color: Colors.red),
                ),
          );
        },
        loading: () => SliverToBoxAdapter(
              child: isShowLoading
                  ? const LoadingWidget()
                  : placeHolderWidget ?? const SizedBox.shrink(),
            ));
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
