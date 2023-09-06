import 'package:base_project/utils/colors.dart';
import 'package:base_project/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputFormField extends StatelessWidget {
  final String hintText;
  final String? keyName;
  final TextEditingController? controller;
  final String? Function(String? value) validator;
  final TextInputType textType;
  final void Function()? onTap;
  final Color? hintColor;
  final int? maxLines;
  final FontWeight fontWeight;
  final bool enableBorder;
  final bool? enabled;
  final TextCapitalization? textCapitalization;
  final bool? showSuffixArrow;
  final bool? autofocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final TextStyle? fontStyle;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final Color? fillColor;

  const TextInputFormField(
      {super.key,
      required this.hintText,
      required this.keyName,
      required this.validator,
      this.textType = TextInputType.text,
      this.fontWeight = FontWeight.w400,
      this.enableBorder = true,
      this.controller,
      this.onTap,
      this.enabled = true,
      this.textCapitalization = TextCapitalization.words,
      this.hintColor,
      this.maxLines,
      this.showSuffixArrow = false,
      this.autofocus,
      this.suffixIcon,
      this.borderColor,
      this.fontStyle,
      this.inputFormatters,
      this.contentPadding,
      this.prefixIcon,
      this.margin,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.only(left: 20.spMin, right: 19.spMin),
      child: TextFormField(
        controller: controller,
        key: ValueKey(keyName),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        autofocus: autofocus ?? true,
        onTap: onTap,
        onChanged: (value) {},
        showCursor: true,
        cursorColor: colorBlack,
        readOnly: false,
        enabled: enabled,
        textCapitalization: textCapitalization!,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        //textAlign: TextAlign.center,
        style: fontStyle ?? tsS16W500.copyWith(color: colorTextBlack),
        keyboardType: textType,

        decoration: InputDecoration(
          // prefixIconConstraints: BoxConstraints(maxHeight: 14.sp),
          //isDense: true,

          border: const OutlineInputBorder(),
          filled: true,
          fillColor: fillColor ?? colorWhite,
          hintText: hintText,
          //isDense: true,
          isCollapsed: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,

          // labelStyle: TextStyle(color: colorBlack),
          hintStyle: tsS16W500.copyWith(color: hintColor ?? colorC6C6C6),
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(vertical: 20.spMin, horizontal: 20.spMin),

          counter: const Offstage(),
          enabledBorder: enabled!
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.2.spMin,
                  ),
                  borderRadius: BorderRadius.circular(12.spMin))
              : null,
          //errorBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.2.spMin,
              ),
              borderRadius: BorderRadius.circular(12.spMin)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.spMin),
            borderSide: BorderSide(
              color: colorRed, // Customize the color for validation errors
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.spMin),
            borderSide: BorderSide(
              color: colorRed,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
