import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddContactListTile extends StatefulWidget {
  final String text;
  final String subtitle;
  final Function() onPressed;
  final String svgAssetPath;

  AddContactListTile({
    required this.text,
    required this.subtitle,
    required this.onPressed,
    required this.svgAssetPath,
  });

  @override
  _AddContactListTileState createState() => _AddContactListTileState();
}

class _AddContactListTileState extends State<AddContactListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        onTap: () {
          widget.onPressed();
        },
        leading: SvgPicture.asset(
          widget.svgAssetPath,
        ),
        title: Text(
          widget.text,
          style: TextStyle(
            color: SColors.color3,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(fontSize: 11, color: SColors.color3),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: SColors.color3,
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
