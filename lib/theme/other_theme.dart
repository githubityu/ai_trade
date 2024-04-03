import 'package:flutter/material.dart';

class OtherTheme extends ThemeExtension<OtherTheme> {
  OtherTheme();

  factory OtherTheme.of(BuildContext context) {
    return Theme.of(context).extension<OtherTheme>()!;
  }

  @override
  OtherTheme copyWith() {
    return OtherTheme();
  }

  @override
  OtherTheme lerp(ThemeExtension<OtherTheme>? other, double t) {
    if (other is! OtherTheme) return this;
    return OtherTheme();
  }
}
