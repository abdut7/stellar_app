import '/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration appInputDecoration({
  String? label,

  ///[hintStyle] gives custom style to the hint text
  ///default style is tsS16W400 with color hintTextColor
  ///
  TextStyle? hintStyle,
  bool? isSquareBorder = false,
  String? hint,
  double? borderRadius,
  Widget? suffixIcon,
  bool? isWithoutborders,
  bool? isRoundeborders = false,

  ///[suffixIconMaxHeight] sets maximum height for suffixicon
  /// default height is 24.sp
  ///
  double? suffixIconMaxHeight,
  EdgeInsetsDirectional? contentPadding,
  Color? fillColor,
  bool isFilled = false,
}) {
  final InputBorder border;

  if (isSquareBorder == true) {
    border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: colorInActiveBorder, width: 1),
    );
  } else if (isWithoutborders == true) {
    border = InputBorder.none;
  } else if (isRoundeborders == true) {
    border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(color: colorEBEBEB, width: 0.9.sp),
    );
  } else {
    border = UnderlineInputBorder(
      borderSide: BorderSide(color: colorInActiveBorder, width: 1),
    );
  }
  return InputDecoration(
    filled: isFilled,
    fillColor: fillColor,
    border: border,
    enabledBorder: border,
    focusedBorder: border.copyWith(
      borderSide: BorderSide(color: primaryButtonColor),
    ),
    errorBorder: border.copyWith(
      borderSide: BorderSide(color: colorRed),
    ),
    focusedErrorBorder: border.copyWith(
      borderSide: BorderSide(color: colorRed),
    ),
    disabledBorder: border.copyWith(
      borderSide: BorderSide(color: colorInActiveBorder),
    ),
    hintText: hint,
    labelText: label,
    alignLabelWithHint: true,
    isDense: true,
    contentPadding: contentPadding ??
        EdgeInsets.symmetric(vertical: 20.sp, horizontal: 0.sp),
    labelStyle: (hintStyle ?? tsS17W400).copyWith(color: hintTextColor),
    floatingLabelStyle: (hintStyle ?? tsS17W400).copyWith(color: hintTextColor),
    hintStyle: hintStyle ?? tsS17W400.copyWith(color: hintTextColor),
    suffixIcon: suffixIcon,
    suffixIconConstraints: BoxConstraints(
      maxHeight: suffixIconMaxHeight ?? 24.sp,
      minHeight: 0.0.sp,
    ),
  );
}

TextStyle get tsS33W700 => TextStyle(
      fontSize: 33.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS33W600 => TextStyle(
      fontSize: 33.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS33W500 => TextStyle(
      fontSize: 33.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS33W400 => TextStyle(
      fontSize: 33.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS32W700 => TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS32W600 => TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS32W500 => TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS32W400 => TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS31W700 => TextStyle(
      fontSize: 31.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS31W600 => TextStyle(
      fontSize: 31.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS31W500 => TextStyle(
      fontSize: 31.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS31W400 => TextStyle(
      fontSize: 31.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS30W700 => TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS30W600 => TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS30W500 => TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS30W400 => TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS29W700 => TextStyle(
      fontSize: 29.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS29W600 => TextStyle(
      fontSize: 29.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS29W500 => TextStyle(
      fontSize: 29.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS29W400 => TextStyle(
      fontSize: 29.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS28W700 => TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS28W600 => TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS28W500 => TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS28W400 => TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS27W700 => TextStyle(
      fontSize: 27.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS27W600 => TextStyle(
      fontSize: 27.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS27W500 => TextStyle(
      fontSize: 27.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS27W400 => TextStyle(
      fontSize: 27.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS26W700 => TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS26W600 => TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS26W500 => TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS26W400 => TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS25W700 => TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS25W600 => TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS25W500 => TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS25W400 => TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS24W700 => TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS24W600 => TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS24W500 => TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS24W400 => TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS23W700 => TextStyle(
      fontSize: 23.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS23W600 => TextStyle(
      fontSize: 23.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS23W500 => TextStyle(
      fontSize: 23.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS23W400 => TextStyle(
      fontSize: 23.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS22W700 => TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS22W600 => TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS22W500 => TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS22W400 => TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS21W700 => TextStyle(
      fontSize: 21.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS21W600 => TextStyle(
      fontSize: 21.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS21W500 => TextStyle(
      fontSize: 21.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS21W400 => TextStyle(
      fontSize: 21.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS20W700 => TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS20W600 => TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS20W500 => TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS20W400 => TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS19W700 => TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS19W600 => TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS19W500 => TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS19W400 => TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS18W700 => TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS18W600 => TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS18W500 => TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS18W400 => TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS17W700 => TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS17W600 => TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS17W500 => TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS17W400 => TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS16W700 => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS16W600 => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS16W500 => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS16W400 => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS15W700 => TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS15W600 => TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS15W500 => TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS15W400 => TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS14W700 => TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS14W600 => TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS14W500 => TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS14W400 => TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS13W700 => TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS13W600 => TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS13W500 => TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS13W400 => TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS12W700 => TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS12W600 => TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS12W500 => TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS12W400 => TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS11W700 => TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS11W600 => TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS11W500 => TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS11W400 => TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );

TextStyle get tsS10W700 => TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS10W600 => TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS10W500 => TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
    );
TextStyle get tsS10W400 => TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
    );
