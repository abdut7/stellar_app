import 'package:base_project/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:base_project/Settings/SColors.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CTTile extends StatefulWidget {
  final String labelText;

  const CTTile ({required this.labelText, Key? key}) : super(key: key);

  @override
  State<CTTile > createState() => _CTTileState();
}

class _CTTileState extends State<CTTile > {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundColor: SColors.color14,
            child: SvgPicture.asset(SSvgs.sv06),
          ),
          const SizedBox(width: 15),
          Text(
            widget.labelText,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
