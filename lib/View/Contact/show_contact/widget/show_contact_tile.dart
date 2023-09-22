import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tile extends StatefulWidget {
  final String svgAsset;
  final Color assetColor;
  final Color circleAvatarBackgroundColor;
  final Widget? trailingIcon;
  final String title;

  Tile ({
    required this.svgAsset,
    required this.assetColor,
    required this.circleAvatarBackgroundColor,
    this.trailingIcon,
    required this.title,
  });

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 15),
      child: ListTile(
        leading: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: widget.circleAvatarBackgroundColor,
              child: SvgPicture.asset(
                widget.svgAsset, color: widget.assetColor,),
            ),
            CircleAvatar(
              backgroundColor: SColors.color11,
              radius: 10,
              child: Icon(Icons.add,size: 15,color: SColors.color4,),
            )
          ],
        ),
        title: Text(widget.title, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400,
        ),
        ),
        trailing: widget.trailingIcon,
      ),
    );
  }
}
