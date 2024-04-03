import 'package:flutter/material.dart';
import 'package:ai_trade/exports.dart';
import 'package:ai_trade/gen/colors.gen.dart';


class RoundOutLineText extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color, backgroundColor;
  final bool isOutLine;

  const RoundOutLineText(
      {super.key,
      required this.child,
      this.radius,
      this.color,
      this.backgroundColor,
      this.isOutLine = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 3),
          color: backgroundColor,
          border: isOutLine
              ? Border.fromBorderSide(
                  BorderSide(color: color ?? ColorName.themeColor, width: 1))
              : null),
      child: child,
    );
  }
}

class HalfColorDay extends StatelessWidget {
  final String title;
  final String subTitle;

  const HalfColorDay(this.title, this.subTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 50,
      child: RoundWidget(
        radius: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ColoredBox(
              color: ColorName.themeColor,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            )),
            Expanded(
                child: ColoredBox(
              color: ColorName.bgGray2,
              child: Text(subTitle, textAlign: TextAlign.center,style: const TextStyle(color: ColorName.themeColor)),
            )),
          ],
        ),
      ),
    );
  }
}


class LeftRightText extends StatelessWidget {
  final Widget leading,title;
  const LeftRightText({super.key, required this.leading, required this.title});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity:const VisualDensity(vertical: VisualDensity.minimumDensity),
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: leading,
      title: Align(alignment: Alignment.centerRight,child: title,),
    );
  }
}

