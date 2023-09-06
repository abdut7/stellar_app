import '../utils/colors.dart';
import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onClick,
    required this.title,
    this.backgroundColor,
    this.isEnabled = true,
    this.padding, this.height,
  });
  final VoidCallback? onClick;
  final String title;
  final Color? backgroundColor;
  final bool isEnabled;
  final EdgeInsetsGeometry? padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          margin: padding ?? EdgeInsets.symmetric(vertical: 10.spMin),
          width: double.infinity,
          height: height??56.spMin,
          decoration: BoxDecoration(
              color: isEnabled
                  ? (backgroundColor ?? colorPrimary)
                  : colorDisabledButton,
              borderRadius: BorderRadius.all(Radius.circular(10.spMin))),
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 5.spMin, horizontal: 18.spMin),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: tsS16W700.copyWith(color: colorWhite)),
            ),
          )),
    );
  }
}
