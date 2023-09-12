import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarContainer extends StatefulWidget {
  final String labelText;

  AppBarContainer({required this.labelText});

  @override
  _AppBarContainerState createState() => _AppBarContainerState();
}
class _AppBarContainerState extends State<AppBarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      color: SColors.color12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(SSvgs.sv07,),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Text(
              widget.labelText,
              style: TextStyle(
                color: SColors.color13,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
