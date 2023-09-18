import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavIconWidget extends StatelessWidget {
  final bool isSelected;
  final String svgPath;

  const BottomNavIconWidget({
    super.key,
    required this.svgPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: !isSelected
          ? Colors.transparent
          : const Color.fromRGBO(0, 51, 142, 1),
      child: SvgPicture.asset(svgPath),
    );
  }
}