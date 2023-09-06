import '/providers/language_provider.dart';
import '/utils/colors.dart';
import '/utils/extensions.dart';
import '/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final TextStyle? textStyle;
  final bool? ishideBackButton;
  final EdgeInsetsDirectional? padding;
  final List<Widget>? trailing;
  const CustomAppBar({
    super.key,
    this.title,
    this.textStyle,
    this.onTap,
    this.ishideBackButton = false,
    this.padding,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsetsDirectional.zero,
      child: Row(children: [
        Visibility(
          visible: !ishideBackButton!,
          child: Container(
            height: 38.sp,
            width: 38.sp,
            margin: EdgeInsetsDirectional.only(end: 13.sp),
            decoration: BoxDecoration(
              color: colorE8EFFF,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: onTap,
              icon: Consumer<LanguageProvider>(
                builder: (context, provider, child) {
                  return RotatedBox(
                    quarterTurns: provider.getQuarterTurns,
                    child: SvgPicture.asset(
                      'ic_arrow_left_bold'.asAssetSvg(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? "",
                maxLines: 2,
                style: textStyle ??
                    tsS22W600.copyWith(
                      color: primaryButtonColor,
                    ),
              ),
              Row(
                children: trailing != null ? trailing! : [],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
