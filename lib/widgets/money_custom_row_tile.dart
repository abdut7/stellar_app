import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class CustomRowTile extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomRowTile({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _CustomRowTileState createState() => _CustomRowTileState();
}

class _CustomRowTileState extends State<CustomRowTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: ShapeDecoration(
              color: SColors.color14,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Inter',
              color: SColors.color4,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: widget.onPressed,
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: SColors.color4,
            ),
          ),
        ],
      ),
    );
  }
}
