import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTilee extends StatefulWidget {
  final String text;
  final Function() onTap;
  final String svgAsset;
  final IconData trailingIcon;

  CustomListTilee({
    required this.text,
    required this.onTap,
    required this.svgAsset,
    required this.trailingIcon,
  });

  @override
  _CustomListTileeState createState() => _CustomListTileeState();
}

class _CustomListTileeState extends State<CustomListTilee> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          leading: SvgPicture.asset(widget.svgAsset),
          title: Text(
            widget.text,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Icon(
            widget.trailingIcon,
            color: SColors.color3,
            size: 12,
          ),
        ),
      ),
    );
  }
}
