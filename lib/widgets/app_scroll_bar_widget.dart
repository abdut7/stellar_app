import '/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomScrollBar extends RawScrollbar {
  AppCustomScrollBar({
    Key? key,
    double? thickness,
    bool? interactive,
    Radius? radius,
    bool? thumbVisibility,
    bool? trackVisibility,
    Color? trackColor,
    Color? thumbColor,
    ScrollController? controller,
    required Widget child,
  }) : super(
          key: key,
          controller: controller,
          interactive: interactive ?? true,
          radius: radius ?? Radius.circular(10.sp),
          thumbVisibility: thumbVisibility ?? true,
          trackVisibility: trackVisibility ?? true,
          trackColor: trackColor ?? colorF5F5F5,
          thumbColor: thumbColor ?? primaryButtonColor,
          trackRadius: radius ?? Radius.circular(100.sp),
          trackBorderColor: Colors.transparent,
          child: child,
        );
}
