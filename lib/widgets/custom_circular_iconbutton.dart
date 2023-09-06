import '/utils/colors.dart';
import '/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircularIconButton extends StatelessWidget {
  final String? iconName;
  final double radius;
  // final double width;
  final double iconHeight;
  final double iconWidth;
  final bool enableBorder;
  final Color? backGroudColor;
  final void Function()? onTap;

  const CustomCircularIconButton({
    Key? key,
    required this.iconName,
    this.radius = 62,
    //this.width = 62,
    this.iconHeight = 30,
    this.iconWidth = 30,
    this.backGroudColor,
    this.enableBorder = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: radius.sp,
        width: radius.sp,
        decoration: BoxDecoration(
            color: backGroudColor ?? colorF6F5F8,
            borderRadius: BorderRadius.circular(radius.sp),
            border: enableBorder
                ? Border.all(width: 1.sp, color: colorEBEBEB)
                : null),
        child: Center(
          child: SvgPicture.asset(
            iconName!.asAssetSvg(),
            height: iconHeight.sp,
            width: iconWidth.sp,
          ),
        ),
      ),
    );
  }
}
