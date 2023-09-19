import 'package:flutter/material.dart';

class LikeDislikeButton extends StatefulWidget {
  final Color circleColor;
  final IconData iconData;
  final VoidCallback? onPressed;

  LikeDislikeButton({
    required this.circleColor,
    required this.iconData,
    this.onPressed,
  });

  @override
  _LikeDislikeButtonState createState() => _LikeDislikeButtonState();
}

class _LikeDislikeButtonState extends State< LikeDislikeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.circleColor,
      ),
      child: IconButton(
        icon: Icon(widget.iconData, color: Colors.white, size: 15),
        onPressed: widget.onPressed,
      ),
    );
  }
}
