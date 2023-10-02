import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class STSTile extends StatefulWidget {
  final String svgAsset;
  final String text;
  final VoidCallback onPressed;

  STSTile(
      {required this.svgAsset, required this.text, required this.onPressed});

  @override
  State<STSTile> createState() => _STSTileState();
}

class _STSTileState extends State<STSTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: SvgPicture.asset(widget.svgAsset),
        title: Text(
          widget.text,
          style: TextStyle(
            color: SColors.color3,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios, color: SColors.color3, size: 15),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
