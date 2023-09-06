import '/providers/custom_tabbar_provider.dart';
import '/utils/colors.dart';
import '/widgets/app_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomTabBarWidget extends StatefulWidget {
  final List<String> list;

  ///[outerPadding] outer padding for the button
  ///
  final EdgeInsets? outerPadding;

  ///[innerHPadding] Inner horizontal padding for the button,
  /// default value is 12.sp,
  /// value should be in double
  ///
  final double? innerHPadding;
  const CustomTabBarWidget({
    Key? key,
    required this.list,
    this.outerPadding,
    this.innerHPadding,
  }) : super(key: key);

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CustomTabBarProvider>(
      builder: (context, provider, child) => SizedBox(
        height: 56.sp,
        child: ListView.builder(
          padding: widget.outerPadding ?? EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: widget.list.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsetsDirectional.only(end: 14.sp),
            child: _ThisTabbarButton(
              innerPadding: widget.innerHPadding,
              widgetId: index,
              selectedWidgetId: provider.selectedWidgetId,
              name: widget.list[index],
              onTap: () {
                provider.setSelectedWidgetId = index;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ThisTabbarButton extends StatelessWidget {
  final int? widgetId;
  final int? selectedWidgetId;
  final String? name;
  final double? innerPadding;
  final VoidCallback onTap;
  const _ThisTabbarButton(
      {Key? key,
      required this.name,
      required this.widgetId,
      required this.selectedWidgetId,
      required this.onTap,
      this.innerPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = colorWhite;
    Color textColor = primaryButtonColor;
    if (selectedWidgetId == widgetId) {
      backgroundColor = primaryButtonColor;
      textColor = colorWhite;
    }
    return AppButton(
      text: name ?? "",
      showBorder: true,
      textColor: textColor,
      backgroundColor: backgroundColor,
      onTap: onTap,
      padding: EdgeInsets.symmetric(horizontal: innerPadding ?? 12.sp),
    );
  }
}

class CustomTabBarModel {
  int? id;
  String? name;
  CustomTabBarModel({
    this.id,
    this.name,
  });
}
