import '/providers/language_provider.dart';
import '/utils/colors.dart';
import '/utils/extensions.dart';
import '/utils/styles.dart';
import '/widgets/app_custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppOptionCardWidget extends StatelessWidget {
  final bool? isShowDescription;
  final String? description;
  final String? boldDescription;
  final String title;
  final Widget? prefixIcon;
  final GestureTapCallback? onTap;
  final bool? showArrow;
  final TextStyle? style;
  final double? iconHeight;
  final double? iconWidth;
  final double? prefixIconHeight;
  final double? prefixIconWidth;
  final Widget? sufixIcon;
  final EdgeInsetsGeometry? padding;
  final String? iconName;
  const AppOptionCardWidget({
    super.key,
    this.isShowDescription,
    this.boldDescription,
    this.description,
    required this.title,
    this.prefixIcon,
    this.onTap,
    this.showArrow,
    this.style,
    this.iconHeight = 19,
    this.iconWidth = 18,
    this.prefixIconHeight = 24,
    this.prefixIconWidth = 24,
    this.sufixIcon,
    this.padding,
    this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    // Widget? prefixIconWidget;
    // if (prefixIcon != null) {
    //   prefixIconWidget = Container(
    //     margin: EdgeInsetsDirectional.only(end: 12.sp),
    //     height: prefixIconHeight!.sp,
    //     width: prefixIconHeight!.sp,
    //     child: SvgPicture.asset(
    //       prefixIcon!.asAssetSvg(),
    //     ),
    //   );
    // }
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 27.sp, vertical: 18.sp),
        decoration: BoxDecoration(
          // color: colorWhite,
          border: Border.all(color: colorEBEBEB, width: 1),
          borderRadius: BorderRadius.circular(9.sp),
        ),
        child: Row(
          children: [
            prefixIcon ?? const SizedBox(),
            prefixIcon != null
                ? SizedBox(
                    width: 12.sp,
                  )
                : const SizedBox(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: style ??
                        tsS20W600.copyWith(
                          color: primaryButtonColor,
                        ),
                  ),
                  Visibility(
                    visible: isShowDescription ?? false,
                    child: Row(
                      children: [
                        Text(
                          description ?? "",
                          style: tsS13W600.copyWith(
                            color: color666666,
                          ),
                        ),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          boldDescription ?? "",
                          style: tsS13W600.copyWith(
                            color: color3C3F4E,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sufixIcon != null
                ? sufixIcon!
                : Visibility(
                    visible: showArrow ?? true,
                    child: RotatedBox(
                      quarterTurns: 0,
                      child: SizedBox(
                        height: iconHeight!.sp,
                        width: iconWidth!.sp,
                        child: Consumer<LanguageProvider>(
                          builder: (context, provider, child) => RotatedBox(
                            quarterTurns: provider.getQuarterTurns,
                            child: SvgPicture.asset(
                              'ic_arrow_right_bold'.asAssetSvg(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class OptionCardWidget extends StatelessWidget {
  final bool? isShowDescription;
  final String? description;
  final String? boldDescription;
  final String title;
  final String? prefixIcon;
  final GestureTapCallback? onTap;
  final bool? showArrow;
  final TextStyle? style;
  final double? iconHeight;
  final double? iconWidth;
  final double? prefixIconHeight;
  final double? prefixIconWidth;
  final bool? showToggle;
  final Function(bool value) onChanged;
  final bool switchValue;
  final EdgeInsetsGeometry? padding;
  const OptionCardWidget({
    super.key,
    this.isShowDescription,
    this.boldDescription,
    this.description,
    required this.title,
    this.prefixIcon,
    this.onTap,
    this.showArrow,
    this.style,
    this.iconHeight = 19,
    this.iconWidth = 18,
    this.prefixIconHeight = 24,
    this.prefixIconWidth = 24,
    this.showToggle = false,
    this.padding,
    required this.onChanged,
    required this.switchValue,
  });

  @override
  Widget build(BuildContext context) {
    Widget? prefixIconWidget;
    if (prefixIcon != null) {
      prefixIconWidget = Container(
        margin: EdgeInsetsDirectional.only(end: 12.sp),
        height: prefixIconHeight!.sp,
        width: prefixIconWidth!.sp,
        child: SvgPicture.asset(
          prefixIcon!.asAssetSvg(),
        ),
      );
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 27.sp, vertical: 18.sp),
        decoration: BoxDecoration(
          // color: colorWhite,
          border: Border.all(color: colorEBEBEB, width: 1),
          borderRadius: BorderRadius.circular(9.sp),
        ),
        child: Row(
          children: [
            Container(
              child: prefixIconWidget,
            ),
            Expanded(
              child: Text(
                title,
                style: style ??
                    tsS20W600.copyWith(
                      color: primaryButtonColor,
                    ),
              ),
            ),
            showToggle == true
                ? SizedBox(
                    height: 20.sp,
                    width: 40.sp,
                    child: AppCustomSwitch(
                      onChanged: onChanged,
                      value: switchValue,
                    ),
                  )
                : RotatedBox(
                    quarterTurns: 0,
                    child: SizedBox(
                      height: iconHeight!.sp,
                      width: iconWidth!.sp,
                      child: SvgPicture.asset(
                        'ic_arrow_right_bold'.asAssetSvg(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class AppOptionCardWithToggleWidget extends StatelessWidget {
  final bool isShowDescription;
  final String title;
  final EdgeInsets? innerPadding;
  final Function(bool value) onChanged;
  final bool switchValue;
  final String? prefixIcon;
  final TextStyle? style;
  final double toggleHeight;
  final double toggleWidth;
  final double prefixIconHeight;
  final double prefixIconWidth;
  final bool enableGradient;
  final bool enableBorder;

  const AppOptionCardWithToggleWidget({
    super.key,
    required this.isShowDescription,
    required this.title,
    this.innerPadding,
    required this.onChanged,
    required this.switchValue,
    this.prefixIcon,
    this.style,
    this.toggleHeight = 24,
    this.toggleWidth = 48,
    this.prefixIconHeight = 24,
    this.prefixIconWidth = 24,
    this.enableGradient = true,
    this.enableBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    // final langProvider = context.watch<LanguageProvider>();
    // int quarterTurns = 0;
    // if (langProvider.isArabic) {
    //   quarterTurns = 2;
    // }
    Widget? prefixIconWidget;
    if (prefixIcon != null) {
      prefixIconWidget = Container(
        margin: EdgeInsetsDirectional.only(end: 12.sp),
        height: prefixIconHeight.sp,
        width: prefixIconWidth.sp,
        child: RotatedBox(
          quarterTurns: 0,
          child: SvgPicture.asset(
            prefixIcon!,
          ),
        ),
      );
    }
    return Container(
      padding: innerPadding ??
          EdgeInsets.symmetric(horizontal: 24.sp, vertical: 18.sp),
      decoration: BoxDecoration(
          border:
              enableBorder ? Border.all(width: 1.sp, color: colorEBEBEB) : null,
          gradient: enableGradient
              ? LinearGradient(
                  colors: [
                    colorWhite.withOpacity(0.58),
                    colorWhite.withOpacity(0.49)
                  ],
                )
              : null,
          // color: colorWhite,
          borderRadius: BorderRadius.circular(9.sp)),
      child: Row(
        children: [
          Container(
            child: prefixIconWidget,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: style ??
                      tsS20W600.copyWith(
                        color: primaryButtonColor,
                      ),
                ),
                Visibility(
                  visible: isShowDescription,
                  child: Row(
                    children: [
                      Text(
                        "MON,TUE,WED,THU,FRI",
                        style: tsS13W600.copyWith(
                          color: color666666,
                        ),
                      ),
                      SizedBox(
                        width: 8.sp,
                      ),
                      Text(
                        "07PM to 08PM",
                        style: tsS13W600.copyWith(
                          color: primaryButtonColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: toggleHeight.sp,
            width: toggleWidth.sp,
            child: AppCustomSwitch(
              onChanged: onChanged,
              value: switchValue,
            ),
          )
        ],
      ),
    );
  }
}
