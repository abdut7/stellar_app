import '/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  final bool value;
  final GestureTapCallback onTap;
  final double width;
  final double height;

  const CustomCheckBoxWidget({
    required this.value,
    required this.onTap,
    this.height = 26,
    this.width = 26,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;
    Widget? child;
    if (value) {
      decoration = BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(5.sp),
        border: Border.all(color: const Color(0xFF3C3F4E)),
        color: const Color(0xFF3C3F4E),
      );
      child = SvgPicture.asset(
        'tick_white'.asAssetSvg(),
        fit: BoxFit.contain,
      );
    } else {
      decoration = BoxDecoration(
        //shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(5.sp),
        border: Border.all(color: const Color(0xFFD0D0D0)),
      );
    }
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: width.sp,
        height: height.sp,
        decoration: decoration,
        padding: EdgeInsets.all(3.sp),
        child: child,
      ),
    );
  }
}
