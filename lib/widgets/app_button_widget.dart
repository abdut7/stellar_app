import '/utils/colors.dart';
import '/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends _ThisAppButton {
  const AppButton({
    Key? key,
    super.backgroundColor,
    super.textColor,
    required super.text,
    super.shadow,
    required super.onTap,
    super.textStyle,
    super.padding,
    super.height,
    super.prefixIcon,
    super.showBorder,
    super.borderRadius,
  }) : super(key: key);

  factory AppButton.curvedButton({
    final Color? backgroundColor,
    final Color? textColor,
    required String text,
    final BoxShadow? shadow,
    required GestureTapCallback onTap,
    final TextStyle? textStyle,
    final EdgeInsets? padding,
    final double? height,
    final Widget? prefixIcon,
    final bool? showBorder,
  }) {
    return AppButton(
      text: text,
      onTap: onTap,
      backgroundColor: backgroundColor,
      textColor: textColor,
      shadow: shadow,
      textStyle: textStyle,
      padding: padding,
      height: height,
      prefixIcon: prefixIcon,
      showBorder: showBorder,
      borderRadius: 44.sp,
    );
  }
  factory AppButton.squareButton({
    final Color? backgroundColor,
    final Color? textColor,
    required String text,
    final BoxShadow? shadow,
    required GestureTapCallback onTap,
    final TextStyle? textStyle,
    final EdgeInsets? padding,
    final double? height,
    final Widget? prefixIcon,
    final bool? showBorder,
  }) {
    return AppButton(
      text: text,
      onTap: onTap,
      backgroundColor: backgroundColor,
      textColor: textColor,
      shadow: shadow,
      textStyle: textStyle,
      padding: padding,
      height: height,
      prefixIcon: prefixIcon,
      showBorder: showBorder,
      borderRadius: 0.sp,
    );
  }
}

class _ThisAppButton extends StatelessWidget {
  const _ThisAppButton({
    Key? key,
    this.backgroundColor,
    this.textColor,
    required this.text,
    this.shadow,
    required this.onTap,
    this.textStyle,
    this.padding,
    this.height,
    this.prefixIcon,
    this.showBorder,
    this.borderRadius,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final BoxShadow? shadow;
  final GestureTapCallback onTap;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double? height;
  final Widget? prefixIcon;
  final bool? showBorder;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRs = borderRadius != null
        ? BorderRadius.circular(borderRadius!)
        : BorderRadius.circular(10.sp);

    BoxBorder? border;
    if (showBorder == true) {
      border = Border.all(color: colorInActiveBorder, width: 1);
    }

    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: height ?? 56.sp,
        decoration: BoxDecoration(
          color: backgroundColor ?? primaryButtonColor,
          borderRadius: borderRs,
          border: border,
          boxShadow: [shadow ?? const BoxShadow(color: Colors.transparent)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            prefixIcon != null
                ? Padding(
                    padding: EdgeInsetsDirectional.only(start: 12.sp),
                    child: prefixIcon,
                  )
                : const SizedBox(),
            Padding(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 12.sp),
              child: Text(
                text,
                style: textStyle ??
                    tsS17W700.copyWith(color: textColor ?? colorWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
