import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchDocumentListTile extends StatefulWidget {
  final String fileType;
  final String fileSize;
  final String time;
  final String svgAssetPath;
  final Function()? onPressed;

  SearchDocumentListTile({
    required this.fileType,
    required this.fileSize,
    required this.time,
    required this.svgAssetPath,
    this.onPressed,
  });

  @override
  _SearchDocumentListTileState createState() => _SearchDocumentListTileState();
}

class _SearchDocumentListTileState extends State<SearchDocumentListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onPressed,
      leading: SvgPicture.asset(widget.svgAssetPath),
      title: Text(
        widget.fileType,
        style: TextStyle(
          color: SColors.color3,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        widget.fileSize,
        style: TextStyle(
          color: SColors.color8,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Text(
        widget.time,
        style: TextStyle(
          color: SColors.color8,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}