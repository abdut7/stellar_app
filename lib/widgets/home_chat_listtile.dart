import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeChatListTile extends StatefulWidget {
  final bool showDoubleTick;
  final String title1;
  final String title2;
  final String subtitle1;
  final String subtitle2;

  const HomeChatListTile({
    Key? key,
    required this.showDoubleTick,
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
  }) : super(key: key);

  @override
  State<HomeChatListTile> createState() => _HomeChatListTileState();
}

class _HomeChatListTileState extends State<HomeChatListTile> {
  @override
  Widget build(BuildContext context) {
    Color? getTitle2Color() {
      if (widget.title2 == 'Yesterday') {
        return SColors.color9;
      } else if (widget.title2.contains(':')) {
        return Color(0xFF9FC4E8);
      }
      return null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: SColors.color14,
          radius: 30,
          child: Stack(
            children: <Widget>[
              Center(child: SvgPicture.asset(SSvgs.sv06)),
              Container(
                margin: EdgeInsets.only(left: 45, top: 35),
                width: 18,
                height: 18,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 4,
                      top: 4,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: ShapeDecoration(
                          color: Color(0xFF50924E),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.title1,
              style: TextStyle(
                color: Color(0xFF161616),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8),
            Text(
              widget.title2,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: getTitle2Color(),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.subtitle1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Color(0xFF5B5B5B),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 8),
            Visibility(
              visible: !widget.showDoubleTick,
              child: Container(
                width: 20,
                height: 20,
                decoration: ShapeDecoration(
                  color: Color(0xFF9FC4E8),
                  shape: OvalBorder(),
                ),
                child: Center(
                  child: Text(
                    widget.subtitle2,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            if (widget.showDoubleTick)
              Icon(
                Icons.done_all,
                color: Colors.green,
              ),
          ],
        ),
      ),
    );
  }
}
