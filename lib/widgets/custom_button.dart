import '/utils/colors.dart';
import '/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final bool isDarkColour;
  final double borderRadius;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.isDarkColour = false,
    this.borderRadius = 9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
            left: 37.sp, right: 37.sp, top: 14.sp, bottom: 14.sp),
        decoration: BoxDecoration(
          color: isDarkColour ? color373A4B : colorWhite,
          borderRadius: BorderRadius.circular(borderRadius.sp),
          border: Border.all(width: 1.sp, color: colorEBEBEB),
        ),
        child: Text(
          text ?? "",
          style: tsS17W700.copyWith(
              color: isDarkColour ? colorWhite : color373A4B),
        ),
      ),
    );
  }
}
