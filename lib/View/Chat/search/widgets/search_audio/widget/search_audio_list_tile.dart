import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAudioListTile extends StatefulWidget {
  final String fileType;
  final String fileSize;
  final String time;

  SearchAudioListTile({required this.fileType, required this.fileSize, required this.time});

  @override
  _SearchAudioListTileState createState() => _SearchAudioListTileState();
}

class _SearchAudioListTileState extends State<SearchAudioListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: SvgPicture.asset(SSvgs.audioLogo), // Make sure SSvgs.audioLogo is defined
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