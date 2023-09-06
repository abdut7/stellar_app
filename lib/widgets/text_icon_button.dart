import '/utils/colors.dart';
import '/utils/extensions.dart';
import '/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextIconButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final String? iconName;
  final double? iconHeight;
  final double? iconWidth;
  final TextStyle? style;
  const TextIconButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.iconName,
    this.iconHeight = 19.4,
    this.iconWidth = 19.4,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text ?? "",
              style: style ?? tsS15W700.copyWith(color: color3C3F4E)),
          SizedBox(width: 10.sp),
          SvgPicture.asset(
            (iconName ?? "plus_circle").asAssetSvg(),
            height: iconHeight!.sp,
            width: iconWidth!.sp,
          ),
        ],
      ),
    );
  }
}
